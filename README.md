# Giropops Senhas
Giropops Senhas é uma aplicação desenvolvida como parte do curso Descomplicando Kubernetes da Escola Linuxtips. Este projeto utiliza práticas modernas de containerização para criar uma aplicação simples e eficiente, demonstrando a integração com tecnologias leves e seguras.

## 🚀 Características do Projeto?
Uma das principais características deste projeto é o uso das Chainguard Images, imagens de contêiner otimizadas para segurança, desempenho e tamanho reduzido. Em vez de usar imagens tradicionais com múltiplas camadas e potenciais vulnerabilidades, optamos por:

### 🛡️ Imagens Leves e Seguras
As imagens da Chainguard (como [cgr.dev/chainguard/python](https://cgr.dev/chainguard/python)) são projetadas para incluir apenas o essencial para executar a aplicação. Elas eliminam dependências desnecessárias e reduzem significativamente a superfície de ataque, tornando o ambiente mais seguro.

### ⚡ Menos Camadas, Maior Performance
Utilizando o conceito de multi-stage builds:
- O primeiro estágio instala as dependências necessárias em um ambiente isolado.
- O segundo estágio utiliza apenas os artefatos finais (código e bibliotecas), descartando o que não é necessário.

Isso resulta em imagens menores, mais rápidas de transferir e mais ágeis para rodar.

## 🛠️ Como executar
1. **Criar a Imagem**
   O primeiro passo é construir a imagem Docker baseada no Dockerfile configurado:
   ```bash
   docker build -t giropops-senhas:1.0 .
   ```

2. **Rodar o Container**
   Para executar a aplicação, utilize o comando abaixo. Certifique-se de que o Redis esteja configurado corretamente.
   ```bash
   docker run -d --name giropops-senhas -p 5000:5000 --env REDIS_HOST=192.168.0.1 giropops-senhas:1.0
   ```

## 🧱 Benefícios do Uso das Chainguard Images
### Segurança Avançada:
- Imagens assinadas e verificáveis.
- Sem dependências não utilizadas ou que possam ser exploradas.

### Desempenho Otimizado:
- Imagens compactas reduzem o tempo de build, download e execução.
- Perfeito para cenários que demandam agilidade, como CI/CD e ambientes de produção.

### Manutenção Simplificada:
- Atualizações automáticas para corrigir vulnerabilidades conhecidas.
- Foco exclusivo no ambiente necessário para rodar Python e Flask.

### Melhor Alinhamento com Ambientes Modernos:
- Ideal para aplicações em Kubernetes e orquestração de contêineres.

## 🔗 Dependências Externas
A aplicação utiliza o Redis como backend para armazenar dados temporários. Caso não tenha um Redis disponível, você pode executar um container simples com:
```bash
docker run -d --name redis01 -p 6379:6379 redis
```

## 🌐 Testando a Aplicação
Com o Redis configurado e o container da aplicação em execução, você pode acessar a página principal em:
```http
http://localhost:5000
```

## 🚀 Próximos Passos
- Implementar Kubernetes: Adicionar configuração para deployment, services e pods no Kubernetes.

## 📜 Licença
Este projeto é distribuído sob a licença MIT. Consulte o arquivo LICENSE para mais informações.

