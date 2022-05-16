const { time } = require('console');
const fs = require('fs');

function logMiddelware(req, res, next) {
    const timeElapsed = Date.now();
    const today = new Date(timeElapsed);
    const fecha=today.toLocaleDateString()+ " "+today.getHours()+ ":"+('0'+today.getMinutes()).slice(-2)+ ":"+('0'+today.getSeconds()).slice(-2);
    fs.appendFileSync("log.txt","\n\b"+fecha+" | Se agregó un producto ");
    next();
}
module.exports = logMiddelware;