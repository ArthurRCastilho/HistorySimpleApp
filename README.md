# History Simple App

Este aplicativo tem o intuito de mostrar fatos históricos de determinados anos usando a API: 
```
https://api.api-ninjas.com/v1/historicalevents
```

## Aplicativo
### Páginas
- App contém 3 telas
1. Tela principal, com searchBar para pesquisar, histórico de ultimas pesquisas (Row com anos pesquisados), e abaixo as ultimas histórias acessadas
2. Tela Home (SearchBar) -> Tela de resultado de pesquisas, mostra todas as histórias retornadas pela API (OBS: Toda a pesquisa é armazenda no App para usar Cache caso necessário)
3. Tela Home (Histórico de pesquisa[Row com anos pesquisados]) -> Tela de resultado de pesquisa, é a mesma tela porém buscando o que já havia pesquisado anteriormente
4. Tela de história: Tela que conta a história selecionada pelo usuário, onde tem todos os textos retornados pela API, também será armazenado pelo App. Pode ser acessada através da tela de pesquisa ou através da tela Home com as histórias já acessadas

### Arquitetura do App
```
history_simple_app/
│
├── .env/
│   ├── example.env        # Variáveis de ambiente (versionado)
│   └── app.env            # Variáveis reais (não versionado)
│
├── lib/
│   ├── core/
│   │   ├── di/
│   │   │   └── injection.dart        # Configuração do GetIt
│   │   │
│   │   ├── network/
│   │   │   ├── http_client.dart      # Cliente HTTP
│   │   │   └── api_exception.dart    # Tratamento de erros
│   │   │
│   │   └── utils/
│   │       └── date_utils.dart       # Utilitários e helpers
│   │
│   ├── database/
│   │   ├── app_database.dart         # Instância do Drift
│   │   │
│   │   ├── tables/
│   │   │   ├── search_history_table.dart
│   │   │   └── history_event_table.dart
│   │   │
│   │   └── daos/
│   │       ├── search_history_dao.dart
│   │       └── history_event_dao.dart
│   │
│   ├── feature/
│   │   └── history/
│   │       ├── data/
│   │       │   ├── models/            # DTOs / Models
│   │       │   ├── mappers/           # Model ↔ Entity
│   │       │   ├── services/
│   │       │   │   ├── history_remote_service.dart
│   │       │   │   └── history_local_service.dart
│   │       │   │
│   │       │   └── repositories/
│   │       │       ├── history_repository.dart
│   │       │       └── history_repository_impl.dart
│   │       │
│   │       └── ui/
│   │           ├── bloc/
│   │           │   ├── history_bloc.dart
│   │           │   ├── history_event.dart
│   │           │   └── history_state.dart
│   │           │
│   │           ├── components/        # Widgets reutilizáveis
│   │           │
│   │           └── pages/
│   │               ├── home/
│   │               │   ├── home_page.dart
│   │               │   └── view_model/
│   │               │       └── home_view_model.dart
│   │               │
│   │               ├── search_result/
│   │               │   ├── search_result_page.dart
│   │               │   └── view_model/
│   │               │       └── search_result_view_model.dart
│   │               │
│   │               └── history_details/
│   │                   ├── history_details_page.dart
│   │                   └── view_model/
│   │                       └── history_details_view_model.dart
│   │
│   ├── env.dart            # Loader do flutter_dotenv
│   └── main.dart           # Entry point
│
├── test/
│   └── widget_test.dart
│
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```