const authService = require('../services/auth.service');

const register = async (req, res, next) => {
    try {
        const { name, email, password } = req.body;
        if (!name || !email || !password) {
            return res.status(400).json({ status: 'fail', message: 'All fields are required' });
        }

        const data = await authService.register({ name, email, password });
        res.status(201).json({ status: 'success', data });
    } catch (error) {
        if (error.message === 'Email already registered') {
            return res.status(400).json({ status: 'fail', message: error.message });
        }
        next(error);
    }
};

const login = async (req, res, next) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ status: 'fail', message: 'Email and password are required' });
        }

        const data = await authService.login(email, password);
        res.status(200).json({ status: 'success', data });
    } catch (error) {
        if (error.message === 'Invalid email or password') {
            return res.status(401).json({ status: 'fail', message: error.message });
        }
        next(error);
    }
};

const refresh = async (req, res, next) => {
    try {
        const { refreshToken } = req.body;
        if (!refreshToken) {
            return res.status(400).json({ status: 'fail', message: 'Refresh token is required' });
        }

        const data = await authService.refresh(refreshToken);
        res.status(200).json({ status: 'success', data });
    } catch (error) {
        res.status(403).json({ status: 'fail', message: error.message });
    }
};

const logout = async (req, res, next) => {
    try {
        const { refreshToken } = req.body;
        if (refreshToken) {
            await authService.logout(refreshToken);
        }
        res.status(204).json({ status: 'success', message: 'Logged out' });
    } catch (error) {
        next(error);
    }
};

const getMe = async (req, res, next) => {
    try {
        // User is attached to req by authMiddleware
        res.status(200).json({ status: 'success', data: { user: req.user } });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    register,
    login,
    refresh,
    logout,
    getMe
};
