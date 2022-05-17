# Exemplo de uso de relacionamento N + N

- A ideia é ter uma lista CSV de categorias e atravez de uma rake task ser possivel criar uma lista no banco de categorias e ao criar um novo produto ser possivel relacionar ele com N categorias e N categorias possuir N produtos.

- O CSV deve possuir o seguinte modelo:

![image](https://user-images.githubusercontent.com/13730504/168841558-690aeba3-5f4c-490c-ac34-521d504e7519.png)

- Para executar a `rake` basta rodar o seguinte comando:

`rake -T csv:import`

