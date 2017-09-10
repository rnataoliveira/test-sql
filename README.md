# Teste SQL

**1** ‐ Identifique as colunas que compõe a chave primária de cada tabela.
>Tabela Customer PK = IdCustomer  
Tabela AddressType PK = CdAddressType  
Tabela CustomerAddress FK IdCustomer + FK CdAddressType = PK

**2** ­‐ Utilizando o comando INSERT de SQL, crie os scripts para cadastrar o cliente abaixo:
>Joãozinho Silva -­‐ 888.777.666-­‐55  
Endereço Residencial:** Rua das Flores, 1. CEP: 01234-­‐567  
Endereço Comercial:** Rua das Pedras, 100 Conjunto 200. CEP: 01234-­567

**3**­ ‐ Quantos endereços diferentes podem ser cadastrado para um cliente?
>R.: Um cliente pode ter um endereço do tipo R(Residêncial), um do tipo C(Comercial) e um do tipo O(Outros).

**4** - ­Dado um CPF, qual seria o passo a passo para excluir um cliente da nossa base de dados?

```sql
DELETE FROM CustomerAddress WHERE IdCustomer = (SELECT IdCustomer FROM Customer WHERE CpfCnpj = 88877766655);
DELETE FROM Customer WHERE CpfCnpj = 88877766655;
```