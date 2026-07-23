const express = require("express");

const app = express();
const PORT = process.env.PORT || 8080;

app.get("/", (req, res) => {
    res.send("Hello World from Cloud Run!");
});

app.get("/healthz", (req, res) => {
    res.status(200).send("OK");
});

app.listen(PORT, () => {
    console.log(`Application is running on port ${PORT}`);
});