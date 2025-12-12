let carrinho = [];
let total = 0;

function adicionarCarrinho(nome, preco) {
    carrinho.push({ nome, preco });
    total += preco;

    atualizarCarrinho();
    abrirCarrinho();
}

function atualizarCarrinho() {
    let itensDiv = document.getElementById("itens-carrinho");
    let totalDiv = document.getElementById("total");

    itensDiv.innerHTML = "";

    carrinho.forEach((item, index) => {
        itensDiv.innerHTML += `
            <div class="item">
                <p>${item.nome} — R$ ${item.preco.toFixed(2)}</p>
                <button onclick="removerItem(${index})">Remover</button>
            </div>
        `;
    });

    totalDiv.innerHTML = `<strong>Total: R$ ${total.toFixed(2)}</strong>`;
}

function removerItem(index) {
    total -= carrinho[index].preco;
    carrinho.splice(index, 1);
    atualizarCarrinho();
}

function abrirCarrinho() {
    document.getElementById("carrinho").classList.add("aberto");
}

function fecharCarrinho() {
    document.getElementById("carrinho").classList.remove("aberto");
}
