var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.qtdUsuarios(req, res);
});

router.get("/grafico/:idAquario", function (req, res) {
    medidaController.grafico(req, res);
});

router.get("/Parabens/:idAquario", function (req, res) {
    medidaController.buscarData(req, res);
});

router.get("/horaAtual/:idAquario", function (req, res) {
    medidaController.buscaHoraAtual(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarUltimaHoraAtual(req, res);
})

router.get("/ranking/:idAquario", function (req, res) {
    medidaController.buscarRanking(req, res);
})

module.exports = router;