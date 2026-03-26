const request = require('supertest');
const app = require('../src/app');
const db = require('../src/config/db');

// Set up environment variables for testing
process.env.JWT_SECRET = 'test_secret';
process.env.JWT_REFRESH_SECRET = 'test_refresh_secret';

// Mock the database query
jest.mock('../src/config/db', () => ({
  query: jest.fn(),
}));

describe('Auth API Endpoints', () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe('GET /api/health', () => {
    it('should return 200 and OK status', async () => {
      const res = await request(app).get('/api/health');
      expect(res.statusCode).toEqual(200);
      expect(res.body).toHaveProperty('status', 'OK');
    });
  });

  describe('POST /api/auth/register', () => {
    it('should fail if email is missing', async () => {
      const res = await request(app)
        .post('/api/auth/register')
        .send({
          name: 'Test User',
          password: 'password123'
        });
      
      expect(res.statusCode).toEqual(400); 
      expect(res.body).toHaveProperty('message', 'Validation failed');
    });

    it('should succeed with valid data (mocked)', async () => {
      // Mock user existence check (no user found)
      db.query.mockResolvedValueOnce({ rows: [] });
      
      // Mock user insertion - User.create
      const mockUser = { id: '1', name: 'Test User', email: 'test@example.com' };
      db.query.mockResolvedValueOnce({ rows: [mockUser] });

      // Mock refresh token storage - User.saveRefreshToken
      db.query.mockResolvedValueOnce({ rows: [] });

      const res = await request(app)
        .post('/api/auth/register')
        .send({
          name: 'Test User',
          email: 'test@example.com',
          password: 'password123'
        });
      
      expect(res.statusCode).toEqual(201);
      expect(res.body.data.user).toHaveProperty('email', 'test@example.com');
      expect(res.body.data).toHaveProperty('accessToken');
      expect(res.body.data).toHaveProperty('refreshToken');
    });
  });
});
