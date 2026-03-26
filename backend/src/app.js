const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const dotenv = require('dotenv');

dotenv.config();

const authRoutes = require('./routes/auth.routes');
const categoryRoutes = require('./routes/category.routes');
const expenseRoutes = require('./routes/expense.routes');
const budgetRoutes = require('./routes/budget.routes');

const app = express();

// Security Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads'));

// Rate Limiting
const generalLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  message: { status: 'fail', message: 'Too many requests from this IP, please try again after 15 minutes' }
});

const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 20, // stricter limit for Auth
  message: { status: 'fail', message: 'Too many login attempts, please try again after 15 minutes' }
});

app.use('/api', generalLimiter);
app.use('/api/auth', authLimiter);

// Root Welcome Route
app.get('/', (req, res) => {
  res.status(200).send(`
    <style>body { font-family: sans-serif; text-align: center; padding: 50px; background: #f4f4f9; color: #333; }</style>
    <div style="max-width: 600px; margin: auto; padding: 40px; background: white; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);">
      <h1 style="color: #6366f1;">Penny Go API is Live! 🚀</h1>
      <p style="font-size: 1.1em;">The backend is running successfully and is ready to handle your financial data.</p>
      <div style="margin-top: 30px;">
        <a href="/api/health" style="display: inline-block; padding: 12px 24px; background: #6366f1; color: white; text-decoration: none; border-radius: 8px; font-weight: bold;">Check API Health</a>
      </div>
    </div>
  `);
});

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/categories', categoryRoutes);
app.use('/api/expenses', expenseRoutes);
app.use('/api/budgets', budgetRoutes);
app.get('/api/health', (req, res) => {
  res.status(200).json({ status: 'OK', message: 'Penny Go Backend is healthy' });
});

// Centralized error handling
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!', message: err.message });
});

module.exports = app;
