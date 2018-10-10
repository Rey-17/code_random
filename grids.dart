//Flutter - Dart
//Función que genera un grid con el contenido traducido en español o ingles,
//@param titulo, parametro que muestra el título del elemento
//@param myLocale, Localización regional del dispositivo
//@param url, url de la página
//@param tipo, el tipo de elemento, puede ser webview o nativo
//@param icono, icono del elemento.

Widget generate_column(String titulo, Locale myLocale, String url, String tipo, Icon icono){
    return tipo == 'web'?
    new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyWebViewPage(
                              title: DemoLocalizations.of(context)
                                  .trans(titulo),
                              url: url_base +
                                  (myLocale.languageCode == 'en'
                                      ? 'en/' + url
                                      : 'es/' + url))));
                },
                child: new Column(
                  children: <Widget>[
                    new Expanded(
                      child: icono,
                    ),
                    new Text(
                      DemoLocalizations.of(context).trans(titulo),
                      style: Theme.of(context).textTheme.headline,
                    )
                  ],
                ),
              ):
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyPage(miTitulo: DemoLocalizations.of(context).trans(titulo), myLocale: myLocale,)));
                },
                child: new Column(
                  children: <Widget>[
                    new Expanded(
                      child: icono,
                    ),
                    new Text(
                      DemoLocalizations.of(context).trans(titulo),
                      style: Theme.of(context).textTheme.headline,
                    )
                  ],
                ),
              );

  }
