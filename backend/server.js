const app = require('./src/app');
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`\n========================================`);
    console.log(`Penny Go Backend Server is running!`);
    console.log(`Port: ${port}`);
    console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
    console.log(`========================================\n`);
});
