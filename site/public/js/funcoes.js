// sessão
function validarSessao() {
    // aguardar();

    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    var b_usuario = document.getElementById("b_usuario");

    if (email != null && nome != null) {
        // window.alert(`Seja bem-vindo, ${nome}!`);
        b_usuario.innerHTML = nome;

        // finalizarAguardar();
    } else {
        window.location = "../login.html";
    }
}

function limparSessao() {
    // aguardar();
    sessionStorage.clear();
    // finalizarAguardar();
    window.location = "../login.html";
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.innerHTML = texto;
    }
}


// modal
function mostrarModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "flex";
}

function fecharModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "none";
}



// MOSTRAR QUANTOS USUARIOS TEM
function obterNumerosUsarios(idSensor) {

    if (proximaAtualizacao != undefined) {
        clearTimeout(proximaAtualizacao);
    }
    
    fetch(`/medidas/ultimas/${idSensor}`, { cache: 'no-store' }).then(function (response) {
        if (response.ok) {
            response.json().then(function (resposta) {
                console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);
                resposta.reverse();
    
                plotarGrafico(resposta);
            });
        } else {
            console.error('Nenhum dado encontrado ou erro na API');
        }
    })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados p/ gráfico: ${error.message}`);
        });
    }
    
    function plotarGrafico(resposta, idSensor) {
    
          for (i = 0; i < resposta.length; i++) {
              var registro = resposta[i];
              var qtdUsuario = registro.qtdUsuario
          }
    
          var qtd_usuarios = document.getElementById("qtd_usuarios")
          qtd_usuarios.innerHTML = qtdUsuario
      }

// MOSTRAR HORA ATUAL
function obterHoraAtual(idAquario) {

    if (proximaAtualizacao != undefined) {
      clearTimeout(proximaAtualizacao);
    }

    fetch(`/medidas/horaAtual/${idAquario}`, { cache: 'no-store' }).then(function (response) {
      if (response.ok) {
        response.json().then(function (resposta) {
          console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);
          resposta.reverse();

          plotarHora(resposta);
        });
      } else {
        console.error('Nenhum dado encontrado ou erro na API');
      }
    })
      .catch(function (error) {
        console.error(`Erro na obtenção dos dados p/ gráfico: ${error.message}`);
      });
  }

  function plotarHora(resposta, idAquario) {

    for (i = 0; i < resposta.length; i++) {
      var registroHora = resposta[i];
      var horaAtual = registroHora.horaAtual
    }

    var horas_atual = document.getElementById("horas_atual")
    horas_atual.innerHTML = horaAtual

    setTimeout(() => atualizarHora(idAquario), 1000)
  }

  function atualizarHora(idAquario) {

    fetch(`/medidas/tempo-real/${idAquario}`, { cache: 'no-store' }).then(function (response) {
      if (response.ok) {
        response.json().then(function (novoRegistro) {

          var horaAtual = novoRegistro[0].horaAtual

          var horas_atual = document.getElementById("horas_atual")
          horas_atual.innerHTML = horaAtual


          // Altere aqui o valor em ms se quiser que o gráfico atualize mais rápido ou mais devagar
          proximaAtualizacao = setTimeout(() => atualizarHora(idAquario), 1000);
        });

      } else {
        console.error('Nenhum dado encontrado ou erro na API');
        // Altere aqui o valor em ms se quiser que o gráfico atualize mais rápido ou mais devagar
        proximaAtualizacao = setTimeout(() => atualizarHora(idAquario), 1000);
      }
    })
      .catch(function (error) {
        console.error(`Erro na obtenção dos dados p/ gráfico: ${error.message}`);
      });

  }