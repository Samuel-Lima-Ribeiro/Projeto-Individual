var express = require("express");
var router = express.Router();

var avisoController = require("../controllers/avisoController");

router.get("/", function (req, res) {
    avisoController.testar(req, res);
});

router.get("/listar", function (req, res) {
    avisoController.listar(req, res);
});

router.get("/listar/:idUsuario", function (req, res) {
    avisoController.listarPorUsuario(req, res);
});

router.get("/pesquisar/:descricao", function (req, res) {
    avisoController.pesquisarDescricao(req, res);
});

router.post("/publicar/:idUsuario", function (req, res) {
    avisoController.publicar(req, res);
});

router.delete("/deletar/:idAviso", function (req, res) {
    avisoController.deletar(req, res);
});

// funcoes para editar JOGO
router.put("/vitoria/:idAviso", function (req, res) {
    avisoController.vitoria(req, res);
});

router.put("/empate/:idAviso", function (req, res) {
    avisoController.empate(req, res);
});

router.put("/derrota/:idAviso", function (req, res) {
    avisoController.derrota(req, res);
});

module.exports = router;