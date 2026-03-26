const User = require('../models/user.model');
const { hashPassword, comparePassword } = require('../utils/password.utils');
const { generateAccessToken, generateRefreshToken, verifyRefreshToken } = require('../utils/jwt.utils');

const register = async (userData) => {
    const { email, password, name } = userData;

    // Check if user already exists
    const existingUser = await User.findByEmail(email);
    if (existingUser) {
        throw new Error('Email already registered');
    }

    // Hash password
    const password_hash = await hashPassword(password);

    // Save user
    const user = await User.create({ name, email, password_hash });

    // Generate tokens
    const accessToken = generateAccessToken(user.id);
    const refreshToken = generateRefreshToken(user.id);

    // Save refresh token in DB
    const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000); // 7 days from now
    await User.saveRefreshToken(user.id, refreshToken, expiresAt);

    return { user, accessToken, refreshToken };
};

const login = async (email, password) => {
    // Find user
    const user = await User.findByEmail(email);
    if (!user) {
        throw new Error('Invalid email or password');
    }

    // Verify password
    const isPasswordValid = await comparePassword(password, user.password_hash);
    if (!isPasswordValid) {
        throw new Error('Invalid email or password');
    }

    // Generate tokens
    const accessToken = generateAccessToken(user.id);
    const refreshToken = generateRefreshToken(user.id);

    // Save refresh token in DB
    const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000); // 7 days from now
    await User.saveRefreshToken(user.id, refreshToken, expiresAt);

    // Remove password_hash before returning
    delete user.password_hash;
    return { user, accessToken, refreshToken };
};

const refresh = async (oldRefreshToken) => {
    // 1. Verify token signature
    const payload = verifyRefreshToken(oldRefreshToken);
    if (!payload) {
        throw new Error('Invalid refresh token');
    }

    // 2. Check if it exists in DB
    const storedToken = await User.findRefreshToken(oldRefreshToken);
    if (!storedToken) {
        throw new Error('Refresh token not found');
    }

    // 3. Optional: check for expiry (already checked by jwt.verify)

    // 4. Generate new pair (Refresh token rotation for better security)
    const newAccessToken = generateAccessToken(payload.id);
    const newRefreshToken = generateRefreshToken(payload.id);

    // 5. Replace in DB
    await User.deleteRefreshToken(oldRefreshToken);
    const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000);
    await User.saveRefreshToken(payload.id, newRefreshToken, expiresAt);

    return { accessToken: newAccessToken, refreshToken: newRefreshToken };
};

const logout = async (token) => {
    await User.deleteRefreshToken(token);
};

module.exports = {
    register,
    login,
    refresh,
    logout
};
