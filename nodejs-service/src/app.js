const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.json({ message: 'Hello from Node.js Service!' });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Node.js service running on port ${PORT}`));
