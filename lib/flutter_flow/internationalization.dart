import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? esText = '',
  }) =>
      [ptText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // FirstPage
  {
    'mpshj333': {
      'pt': 'Bem-vindo!',
      'es': '¡Bienvenido!',
    },
    'q6u5n9ir': {
      'pt': 'IDIOMA:',
      'es': 'IDIOMA:',
    },
    '06r4dco2': {
      'pt': 'Iniciar',
      'es': 'Comenzar',
    },
    'ax40zomo': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Onboarding01
  {
    'dqzoqosq': {
      'pt': 'Pular',
      'es': 'Saltar',
    },
    'nimsi6l9': {
      'pt': 'O Horta App é seu novo ajudante!',
      'es': '¡La aplicación Horta es tu nueva ayuda!',
    },
    'lwvgq39u': {
      'pt':
          'Ele te aproximará dos conceitos da horta e, juntos, vocês vão construir hábitos mais saudáveis de forma simples e viável a rotina',
      'es':
          'Os acercará a los conceptos del huerto y, juntos, construiréis hábitos más saludables en una rutina sencilla y viable.',
    },
    '95mrb321': {
      'pt': 'Pular',
      'es': 'Saltar',
    },
    '182i43lm': {
      'pt': 'Chega de dúvidas, consulte seu mentor!',
      'es': '¡No más dudas, consulta a tu mentor!',
    },
    '4rzh81w4': {
      'pt':
          'Descubra rapidamente: novas espécies, o que deve-se fazer, manejos do cultivo, curiosidades e outras informações.',
      'es':
          'Descubre rápidamente: nuevas especies, qué hacer, gestión del cultivo, curiosidades y otra información.',
    },
    '32nexy40': {
      'pt': 'Pular',
      'es': 'Saltar',
    },
    '4z6cx6s0': {
      'pt': 'Gerencie de onde estiver',
      'es': 'Gestiona desde donde estés',
    },
    'lj6l34fe': {
      'pt':
          'Nada de desculpas! Com o Horta App você cuida da sua horta quando quiser e aonde estiver, de maneira agendada ou imediata.',
      'es':
          '¡No hay excusas! Con la App de Horta podrás cuidar de tu jardín cuando quieras y estés donde estés, de forma programada o inmediata.',
    },
    '5chjktrm': {
      'pt': 'Aproveite o Horta App!',
      'es': '¡Disfruta de la App de Horta!',
    },
    'ylk92frl': {
      'pt': 'Faça o login ou cadastre-se para começar',
      'es': 'Inicie sesión o regístrese para comenzar',
    },
    '6fv4dvd6': {
      'pt': 'Começar',
      'es': 'Para comenzar',
    },
    '2zizs1t8': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Login
  {
    '5ymf9vf4': {
      'pt': 'Entrar',
      'es': 'Entrar',
    },
    'c5bs0bd8': {
      'pt': 'Entre em sua conta',
      'es': 'Ingrese a su cuenta',
    },
    '9cl99c6r': {
      'pt': 'Conecte-se para começar sua experiência:',
      'es': 'Conéctate para comenzar tu experiencia:',
    },
    '6zf91480': {
      'pt': 'Email de Usuário',
      'es': 'Correo electrónico del usuario',
    },
    'sobserw4': {
      'pt': 'Senha',
      'es': 'Contraseña',
    },
    'zetkdjyn': {
      'pt': 'Entrar',
      'es': 'Entrar',
    },
    '3b3o9o3n': {
      'pt': 'Criar',
      'es': 'Crear',
    },
    'ap0y4yfs': {
      'pt': 'Bem-vindo!',
      'es': '¡Bienvenido!',
    },
    'azhae5yf': {
      'pt': 'Preencha as informações abaixo para criar sua conta',
      'es': 'Complete la información a continuación para crear su cuenta',
    },
    '4p8laszt': {
      'pt': 'Nome de Usuário',
      'es': 'Nombre de usuario',
    },
    '3y86tns1': {
      'pt': 'Email de Usuário',
      'es': 'Correo electrónico del usuario',
    },
    'izp7759s': {
      'pt': 'Senha',
      'es': 'Contraseña',
    },
    'yiy6q3ru': {
      'pt': 'Confirme sua Senha',
      'es': 'Confirmar la contraseña',
    },
    'd1rqx5fh': {
      'pt': 'Cadastrar',
      'es': 'Registrar',
    },
    'qmpudltp': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Inicio
  {
    'bq1o08r4': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    '4we43svr': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'ilvibl2r': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    'vqxyxfvm': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    'b710cvex': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    '5efmhwax': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    'xk6dhfgy': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    '6uoz6e5z': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'vb63s3b2': {
      'pt': 'Que bom ver você.',
      'es': 'Bueno verte.',
    },
    '2xtgi9o2': {
      'pt': '!',
      'es': '!',
    },
    '3le86gvr': {
      'pt': 'Hortaliças',
      'es': 'Verduras',
    },
    'vpqxdc8r': {
      'pt': 'Ver mais',
      'es': 'Ver más',
    },
    'wb8kxooi': {
      'pt': 'Minhas hortaliças',
      'es': 'mis verduras',
    },
    '2jdyf1x7': {
      'pt': 'Adicione sua hortaliça',
      'es': 'Agrega tu verdura',
    },
    'vjgtlvs4': {
      'pt': 'Explorar',
      'es': 'Para explorar',
    },
    'gpq2ilzu': {
      'pt': 'Cultivo',
      'es': 'Cultivo',
    },
    '7ghdc33t': {
      'pt': 'Manutenção',
      'es': 'Mantenimiento',
    },
    '0guo4cg1': {
      'pt': 'Dicas',
      'es': 'Consejos',
    },
    't4hjzjo5': {
      'pt': 'Pragas',
      'es': 'Plagas',
    },
    'pvovs7nn': {
      'pt': 'Logout',
      'es': 'Cerrar sesión',
    },
    '8uvmwofa': {
      'pt': 'Ferramentas',
      'es': 'Herramientas',
    },
    '54wd8449': {
      'pt': 'Que planta é essa?',
      'es': '¿Qué planta es esta?',
    },
    '67x8b1ni': {
      'pt': 'Agendamento',
      'es': 'Planificación',
    },
    'palyc4za': {
      'pt': 'Calculadora',
      'es': 'Calculadora',
    },
    '5jq1f7de': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    '6uqacfdw': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // DetalhesHort
  {
    '3fqj0q2e': {
      'pt': 'Nome popular: ',
      'es': 'Nombre popular:',
    },
    '6bmjyz3v': {
      'pt': 'Clima',
      'es': 'Clima',
    },
    'ndtqjyxd': {
      'pt': 'Temperaturas',
      'es': 'Temperaturas',
    },
    '5ijbq5r9': {
      'pt': 'Espaço (m)',
      'es': 'Espacio (m)',
    },
    'ggllhf5f': {
      'pt': 'Colheita',
      'es': 'Cosecha',
    },
    'j5x14wbn': {
      'pt': 'dias após o plantio',
      'es': 'días después de la siembra',
    },
    'yq77gmd3': {
      'pt': '',
      'es': '',
    },
  },
  // Perfil
  {
    'cwri493t': {
      'pt': 'Sua Conta',
      'es': 'Su cuenta',
    },
    '4ug63yvm': {
      'pt': 'Editar Perfil',
      'es': 'Editar perfil',
    },
    '8eqaplsy': {
      'pt': 'Seu App',
      'es': 'Tu aplicación',
    },
    '4e1mtdo2': {
      'pt': 'Sobre o App',
      'es': 'Acerca de la aplicación',
    },
    'lxx9cnoa': {
      'pt': 'Suporte',
      'es': 'Soporte',
    },
    'emvtgmel': {
      'pt': 'Log Out',
      'es': 'Cerrar sesión',
    },
    'xj13rfqi': {
      'pt': 'Pefil',
      'es': 'Perfil',
    },
  },
  // Editar_perfil
  {
    'iex82nrs': {
      'pt': 'Edite suas informações',
      'es': 'Edita tu información',
    },
    '1l1vjtfi': {
      'pt': 'Nome',
      'es': 'Nombre',
    },
    '8mwf2v4z': {
      'pt': 'Endereço de Email',
      'es': 'Dirección de correo electrónico',
    },
    'oielyh32': {
      'pt': 'Escolher foto',
      'es': 'Escoge una foto',
    },
    'sv2dbnew': {
      'pt': 'Salvar',
      'es': 'Ahorrar',
    },
    '9aff86wj': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Favoritos
  {
    'xkzhcay6': {
      'pt': 'Hortaliças adicionais favoritas',
      'es': 'Verduras adicionales favoritas',
    },
    'z0o0iv7h': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    's7ivujd7': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'yxdlnc08': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    '8bxu8cci': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    'i73ynytu': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'rcuhxm8f': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    'qymbfl3j': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    '8nt1zeys': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    '4kgdr13w': {
      'pt': 'Favoritos',
      'es': 'Favoritos',
    },
  },
  // SuasPlantas
  {
    'b01yek69': {
      'pt': 'Suas Plantas',
      'es': 'Tus plantas',
    },
    'g85px04m': {
      'pt': 'Monitore as já cultivadas e as que deseja cultivar aqui.',
      'es':
          'Monitoriza los que ya cultivas y los que quieres que crezcan aquí.',
    },
    'nq1dbiui': {
      'pt': 'Plantadas',
      'es': 'plantado',
    },
    '6o58xenr': {
      'pt': 'Não há hortaliça plantada',
      'es': 'No hay vegetales plantados.',
    },
    'h8jxwey8': {
      'pt': 'Verificar no calendário',
      'es': 'Consulta el calendario',
    },
    '7knfnhi0': {
      'pt': 'Quero Plantar',
      'es': 'quiero plantar',
    },
    'qq19u9y6': {
      'pt': 'Adicionar à \"Plantadas\"',
      'es': '',
    },
    '2i3zyevc': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    'vf3smorr': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'm3d1pmxz': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    '7za1d68m': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    'pzo58ooo': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'l7rjjc9y': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    '2c55zyk6': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    'hs3m1uoq': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    '1cva5x0e': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Cultivo
  {
    '9ib9jx2s': {
      'pt': 'Materiais',
      'es': 'Materiales',
    },
    '10s33l39': {
      'pt': 'Planejamento',
      'es': 'Planificación',
    },
    'cimbcw47': {
      'pt': 'Plantio',
      'es': 'Plantando',
    },
    'ogcv07p2': {
      'pt': 'Quando plantar?',
      'es': '¿Cuándo plantar?',
    },
    'hmd8ny9j': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    '2h0nhbmt': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'p8g2w4cy': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    'sgjexpbq': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    'a9i6pu4p': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'xy6f0l7t': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    'wxk22xxf': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    '9ins2z49': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'i7jbb7kz': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Calendario
  {
    'vle72r3z': {
      'pt': 'Regar',
      'es': 'Agua',
    },
    'b4xdcez4': {
      'pt': '',
      'es': '',
    },
    'wq8t12nt': {
      'pt': 'Digite o nome do seu compromisso',
      'es': '',
    },
    'qfiz786a': {
      'pt': 'Clique para agendar',
      'es': '',
    },
    'ifk84wzh': {
      'pt': 'Lembretes',
      'es': 'Recordatorio',
    },
    '8x0donvz': {
      'pt': 'Fertilização',
      'es': 'Fertilización',
    },
    'n9vsosx3': {
      'pt': 'Lembrete',
      'es': 'Recordatorio',
    },
    'mph7k4mz': {
      'pt': '15h',
      'es': '3 p.m.',
    },
    'upcrqpn1': {
      'pt': 'Quarta, 01/11/2023',
      'es': 'miércoles, 01/11/2023',
    },
    'v7gc0108': {
      'pt': 'Cultivar Alface',
      'es': 'Cultivo de lechuga',
    },
    'l74crfuq': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    'vw32377k': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'bkg1z313': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    'fla8h9gu': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    'd312wics': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'mct1kf3m': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    'l90vc53x': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    'sa6h3upb': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'jrs4sdz6': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // AddHortalica
  {
    'u1blyote': {
      'pt': 'Adicione a planta que deseja cultivar',
      'es': 'Añade la planta que quieras cultivar.',
    },
    's0lx67p5': {
      'pt': 'Coloque as informações abaixo para adicionar a planta ',
      'es': 'Ingrese la información a continuación para agregar la planta.',
    },
    'mxtg2jn7': {
      'pt': 'Adicione a foto',
      'es': 'Añadir foto',
    },
    'gb9vleaj': {
      'pt': 'Faça o upload da imagem aqui...',
      'es': 'Sube la imagen aquí...',
    },
    '5iwwl329': {
      'pt': 'Nome',
      'es': 'Nombre',
    },
    '1s5ibksu': {
      'pt': 'Escreva o nome da planta',
      'es': 'Escribe el nombre de la planta.',
    },
    'jvn95xbv': {
      'pt': 'Descrição',
      'es': 'Descripción',
    },
    'chxvuxj8': {
      'pt': 'Adicione uma descrição',
      'es': 'Agregar una descripción',
    },
    'dhg39m42': {
      'pt': 'Adicionar planta',
      'es': 'Agregar planta',
    },
    'u1prej22': {
      'pt':
          'Precisa de ajuda para identificar a planta que deseja cultivar? Se sim, utilize essa ferramenta.',
      'es':
          '¿Necesita ayuda para identificar la planta que desea cultivar? En caso afirmativo, utilice esta herramienta.',
    },
    '5rxefy4b': {
      'pt': 'Que planta é essa?',
      'es': '¿Qué planta es esta?',
    },
    'mzu1p8ns': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    '5ybzcj62': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'vs6ly5hz': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    'ccllzrdd': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    '6j26k1d5': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'ccywt435': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    'm6nh308m': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    'retxcp0l': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'w3ca5qeo': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Hortalicas
  {
    '53sfiwug': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    'ljj6a8b3': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'u5xc6y5q': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    '7ug0wtj1': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    'bxqar8x8': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'v4eafx1u': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    'uatn0kiq': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    'bzovrh0q': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'khpz1dtp': {
      'pt': 'Hortaliças',
      'es': 'Verduras',
    },
    'c28uxc20': {
      'pt': 'Clique para saber mais sobre as hortaliças',
      'es': 'Haga clic para obtener más información sobre las verduras.',
    },
    'off0wg5v': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Gerenciamento
  {
    'kinxhkhe': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Configuracoes
  {
    '92h0roqs': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Noticias
  {
    'r5shzb11': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // SobreApp
  {
    '6icam3t3': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // MateriaisCultivo
  {
    'fncb2924': {
      'pt': 'Antes de fazer os canteiros',
      'es': 'Antes de hacer las camas',
    },
    'nod3gm3f': {
      'pt': 'Barbante',
      'es': 'Cadena',
    },
    'abr351e9': {
      'pt': 'Estacas de madeira ou pedaços de bambu;',
      'es': 'Estacas de madera o trozos de bambú;',
    },
    '8vwvpgak': {
      'pt': 'Trena ou fita métrica;',
      'es': 'Cinta métrica o cinta métrica;',
    },
    'iye1n0y0': {
      'pt': 'Carrinho de mão;',
      'es': 'Carretilla;',
    },
    'kdoeoxl7': {
      'pt': 'Enxada;',
      'es': 'Azada;',
    },
    'qe0o7vmz': {
      'pt': 'Pá de bico pequena;',
      'es': 'Pala de boquilla pequeña;',
    },
    'v4d9ia2u': {
      'pt': 'Pá quadrada (para juntar);',
      'es': 'Pala cuadrada (para unir);',
    },
    '364bbmy9': {
      'pt': 'Pá de corte (para cavar);',
      'es': 'Pala de corte (para cavar);',
    },
    'br3lh5cc': {
      'pt':
          'Material para estrutura dos canteiros (pedaços de madeira, telhas, tijolo, pedra);',
      'es':
          'Material para la estructura de las camas (trozos de madera, tejas, ladrillo, piedra);',
    },
    'susm48qu': {
      'pt': 'Solo;',
      'es': 'Suelo;',
    },
    '3oa78z3h': {
      'pt':
          'Restos de poda, galhos secos, corte de grama, folhas e outros materiais orgânicos secos.',
      'es':
          'Restos de poda, ramas secas, recortes de césped, hojas y otros materiales orgánicos secos.',
    },
    'xwhnotia': {
      'pt': 'Depois de fazer os canteiros',
      'es': 'Después de hacer las camas',
    },
    '8sz878ns': {
      'pt': 'Semente (se possível sem tratamento químico ou agrotóxicos);',
      'es': 'Semilla (si es posible sin tratamiento químico ni pesticidas);',
    },
    '6dbfcldf': {
      'pt': 'Mudas;',
      'es': 'Plántulas;',
    },
    'fe37j88x': {
      'pt': 'Placa de identificação;',
      'es': 'Placa de identificación;',
    },
    '7sls6i7h': {
      'pt': 'Kit jardinagem (garfo, ancinho e pazinha larga);',
      'es': 'Kit de jardinería (tenedor, rastrillo y pala ancha);',
    },
    'ga60s0of': {
      'pt': 'Mangueira;',
      'es': 'Manguera;',
    },
    'phj7cir6': {
      'pt': 'Regador;',
      'es': 'Regadera;',
    },
    'metmj8u7': {
      'pt': 'Tesoura de poda;',
      'es': 'Tijeras de podar;',
    },
    'd0h9ov4r': {
      'pt': 'Matéria orgânica seca (palha ou folhas secas);',
      'es': 'Materia orgánica seca (paja u hojas secas);',
    },
    'hxzr96iv': {
      'pt': 'Sombrite (caso necessário sombreamento para a horta).',
      'es': 'Sombra (si es necesario sombra para el huerto).',
    },
    'h0meh0ln': {
      'pt': 'Materiais',
      'es': 'Materiales',
    },
    '83yokqgg': {
      'pt': 'Guia de cultivo',
      'es': 'Guía de cultivo',
    },
    'uene5evi': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Planejamento
  {
    '3g5ky280': {
      'pt': '  Tópicos importantes para conhecer antes da construção da horta:',
      'es': 'Temas importantes a saber antes de construir el huerto:',
    },
    '6pnjwp12': {
      'pt': 'Tipos de solo',
      'es': 'tipos de suelo',
    },
    'zbyvujzw': {
      'pt':
          '  Um solo saudável deve ser rico em todo tipo de vida, rico em nutrientes, fofo e aerado, e coberto por bastante matéria seca para protegê-lo. Um solo ideal deve equilibrar três componentes: argila, areia e matéria orgânica. Uma forma de manter esse equilíbrio é misturar os três tipos de solo: argiloso, arenoso e orgânico.',
      'es':
          'Un suelo sano debe ser rico en todo tipo de vida, rico en nutrientes, suave y aireado, y cubierto de abundante materia seca para protegerlo. Un suelo ideal debe equilibrar tres componentes: arcilla, arena y materia orgánica. Una forma de mantener este equilibrio es mezclar los tres tipos de suelo: arcilloso, arenoso y orgánico.',
    },
    'wlohwit7': {
      'pt': 'Vento',
      'es': 'Viento',
    },
    'p8qpyef3': {
      'pt':
          '  Repare na direção e na força do vento. Ele indicará de onde virá a chuva, e entre outros fatores. Além disso, ventos muito fortes e frequentes podem danificar a estrutura da planta.',
      'es':
          'Tenga en cuenta la dirección y la fuerza del viento. Indicará de dónde vendrá la lluvia, entre otros factores. Además, los vientos muy fuertes y frecuentes pueden dañar la estructura de la planta.',
    },
    'hg03brmy': {
      'pt': 'Acesso e terreno',
      'es': 'Acceso y terreno',
    },
    'i91p35se': {
      'pt':
          '  Para evitar hortaliças doentes e contaminadas, certifique-se que a horta esteja distante de esgotos, depósitos de lixo e emissores de fumaça. Por outro lado, o terreno deve ser de fácil acesso, livre de resíduos e de preferência, plano e pouco inclinado.',
      'es':
          'Para evitar vegetales enfermos y contaminados, asegúrese de que el huerto esté alejado de alcantarillas, basureros y emisores de humo. Por otro lado, el terreno debe ser de fácil acceso, libre de residuos y preferiblemente plano y ligeramente inclinado.',
    },
    'ole8axci': {
      'pt': 'Luminosidade',
      'es': 'Luminosidad',
    },
    '7v0d8ljs': {
      'pt':
          '  As plantas necessitam da luz do sol para se desenvolver e realizar a fotossíntese. Um local favorável para a horta deve ter no mínimo 4 horas de incidência solar por dia. Uma dica é a construção dos canteiros virados na direção norte, visto que é a parte que recebe mais sol ao longo do dia e do ano.',
      'es':
          'Las plantas necesitan luz solar para desarrollarse y realizar la fotosíntesis. Una ubicación favorable para el huerto debe tener al menos 4 horas de luz solar al día. Un consejo es construir los parterres orientados al norte, ya que esta es la parte que recibe más sol durante todo el día y el año.',
    },
    'r7rozh44': {
      'pt': 'Acesso e água',
      'es': 'Acceso y agua',
    },
    'j0z0lgc7': {
      'pt':
          '  Repare na umidade do local escolhido. Prefira lugares que próximos aos canteiros, tenham água limpa para regar diariamente as plantas. Se não houver, opte por mangueiras ou sistemas que captem a água da chuva.',
      'es':
          'Tenga en cuenta la humedad en el lugar elegido. Elige lugares que, cerca de los parterres, tengan agua limpia para regar las plantas a diario. Si no las hay, opta por mangueras o sistemas que capturen el agua de lluvia.',
    },
    'a4qjk2tj': {
      'pt': 'Planejamento',
      'es': 'Planificación',
    },
    '0kolp4k4': {
      'pt': 'Guia de cultivo',
      'es': 'Guía de cultivo',
    },
    'm8u3a1gh': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Plantio
  {
    '4e67s1wa': {
      'pt':
          '  O plantio pode ser feito utilizando sementes, mudas ou estacas. Dependendo da espécie, as estacas podem ser plantadas de maneiras diferentes. O melhor horário para semear ou transplantar as mudas para o local definitivo é no começo ou no final do dia.',
      'es':
          'La siembra se puede realizar mediante semillas, plántulas o esquejes. Dependiendo de la especie, los esquejes se pueden plantar de diferentes formas. El mejor momento para sembrar o trasplantar plántulas a su ubicación definitiva es al principio o al final del día.',
    },
    'vgdx1qnh': {
      'pt':
          '  Em uma horta, procura-se manter a maior biodiversidade possível. Alguns dos meios de garantir isso são:',
      'es':
          'En un huerto intentamos mantener la mayor biodiversidad posible. Algunas de las formas de garantizar esto son:',
    },
    'awqwrif2': {
      'pt':
          ' • Diversificar as plantas: quanto mais espécies, maior a variedade de nutrientes disponíveis para as plantas. As raízes variadas ajudam na descompactação do solo. Espécies diferentes são capazes de ajudar umas às outras, afastando insetos com seu cheiro ou textura, atraindo polinizadores e inimigos naturais.',
      'es':
          '• Diversificar las plantas: cuantas más especies, mayor será la variedad de nutrientes disponibles para las plantas. Las variadas raíces ayudan a aflojar el suelo. Las diferentes especies son capaces de ayudarse entre sí, ahuyentando insectos con su olor o textura, atrayendo polinizadores y enemigos naturales.',
    },
    'yly5p7tt': {
      'pt':
          ' • Revolver menos o solo: revolver minimamente ajuda a conservar a vida no solo, tornando-o menos exposto e assim, preserva-se sua condição ideal.',
      'es':
          '• Revolver menos el suelo: Revolver mínimamente el suelo ayuda a preservar la vida en el suelo, haciéndolo menos expuesto y preservando así su condición ideal.',
    },
    'bsois6av': {
      'pt':
          ' • Cobertura de matéria seca: a cobertura vai nutrir e proteger o solo das chuvas fortes e da incidência solar, além de mantê-lo úmido nas estações mais quentes.',
      'es':
          '• Cobertura de materia seca: la cubierta nutrirá y protegerá el suelo de las fuertes lluvias y del sol, además de mantenerlo húmedo en las estaciones más calurosas.',
    },
    '0li78ot7': {
      'pt': 'Plantio',
      'es': 'Plantando',
    },
    '4kqd8cod': {
      'pt': 'Guia de cultivo',
      'es': 'Guía de cultivo',
    },
    '6k3pbwuf': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // QuandoPlantar
  {
    'z9w0j9h5': {
      'pt': 'Quando plantar?',
      'es': '¿Cuándo plantar?',
    },
    'bqhvfapn': {
      'pt': 'Guia de cultivo',
      'es': 'Guía de cultivo',
    },
    'gkaqt13z': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Manutencao
  {
    'nqvzdzkk': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'awfj0is6': {
      'pt': 'Cuidados com a horta',
      'es': 'cuidado del jardín',
    },
    'oqstck5b': {
      'pt': 'Irrigação',
      'es': 'Irrigación',
    },
    'vzwrlzou': {
      'pt': 'Adubação',
      'es': 'fertilizar',
    },
    'gamm12ph': {
      'pt': 'Condução e Poda',
      'es': 'Conducción y poda',
    },
    '1k5ysxpm': {
      'pt': 'Rotação e mudança do local',
      'es': 'Rotación y cambio de ubicación.',
    },
    'gm5bc48r': {
      'pt': 'Colheita',
      'es': 'Cosecha',
    },
    'l2cbimml': {
      'pt': 'Compostagem',
      'es': 'compostaje',
    },
    'ugldk4vd': {
      'pt': 'Segurança',
      'es': 'Seguridad',
    },
    'g33473v8': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    'lxgcn4kd': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'qt8wb9xf': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    'm72h7af5': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    '5penvv39': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'ur1mqx07': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    '6gyb0b6o': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    'hnlmja4w': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'xah0tfa9': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Irrigacao
  {
    'i6u5gd5q': {
      'pt': 'Irrigação',
      'es': 'Irrigación',
    },
    'qveyscln': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'pn1yqgfa': {
      'pt':
          '  A irrigação pode ser feita por meio de regadores, mangueiras, gotejadores ou aspersores. A quantidade de água e frequência variam de acordo com a região, tipo de solo, espécie e a fase de crescimento. As principais informações são:',
      'es':
          'El riego se puede realizar mediante regaderas, mangueras, goteros o aspersores. La cantidad de agua y frecuencia varían según la región, tipo de suelo, especie y fase de crecimiento. La información principal es:',
    },
    'jiq99k9j': {
      'pt':
          ' \n\n• Melhores horários: a indicação é regar nos horários mais frescos do dia, no começo da manha ou no fim da tarde. Indica-se regar duas vezes nos dias quentes e uma vez nos dias frios. Em períodos de chuva, não é necessário regar a horta.\n\n\n • Tipos de solo: conhecer o solo é fundamental para saber a quantidade de água necessária. Os argilosos, retém líquido, permitindo irrigações mais volumosas e espaçadas. Já os solos arenosos, pela fácil lixiviação, permitem regas frequentes e menos volumosas.\n\n\n •Fases da vida: mudas recém-transplantadas necessitam de água com mais frequência. Na fase adulta, as irrigações podem ser mais espaçadas, dependendo da estação e clima do dia.',
      'es':
          '• Mejores horas: la recomendación es regar en las horas más frescas del día, temprano en la mañana o al final de la tarde. Se recomienda regar dos veces en los días calurosos y una vez en los días fríos. En épocas de lluvias no es necesario regar el huerto.\n\n\n • Tipos de suelo: conocer el suelo es fundamental para saber cuánta agua se necesita. Las arcillosas retienen líquido, permitiendo riegos más voluminosos y espaciados. Los suelos arenosos, por su fácil lixiviación, permiten riegos frecuentes y menos voluminosos.\n\n\n •Etapas de la vida: las plántulas recién trasplantadas necesitan agua con mayor frecuencia. En la etapa adulta los riegos pueden ser más espaciados, dependiendo de la estación y la climatología del día.',
    },
    'vfhty7nr': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Adubacao
  {
    'j8ff30ht': {
      'pt':
          '  Uma primeira adubação, conhecida como adubação de base, já é realizada no plantio, ao adicionar o composto orgânico à terra. Porém, outras adubações podem ser feitas conforme o desenvolvimento das plantas. Tais ações são conhecidas como adubação de cobertura: coloca-se o adubo próximo à base da planta ou na linha de plantio da horta. Além do composto, existem outras maneiras para realizar a adubação: com húmus de minhoca, esterco de animais herbívoros ou por meio da adubação verde.',
      'es':
          'Una primera fertilización, denominada fertilización base, se realiza ya en el momento de la siembra, añadiendo abono orgánico al suelo. Sin embargo, se pueden realizar otras fertilizaciones dependiendo del desarrollo de las plantas. Estas acciones se conocen como abono: el fertilizante se coloca cerca de la base de la planta o en la línea de plantación del huerto. Además del compost, existen otras formas de abonar: con humus de lombriz, estiércol de animales herbívoros o mediante abono verde.',
    },
    'pe8rc8km': {
      'pt': 'Adubação',
      'es': 'fertilizar',
    },
    '280r7o7c': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'hxraz4se': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // ConducaoePoda
  {
    '6hwvfqlx': {
      'pt': 'Condução',
      'es': 'Conduciendo',
    },
    'flwmgp5o': {
      'pt':
          '  A condução de plantas com caules flexíveis, por exemplo o tomate, que tende a tombar ao crescer, recomenda-se o apoio com uma estaca (galho, vara de madeira ou bambu) para garantir a sustentação. Pode-se ainda, amarrar um cordão de algodão para firmar a planta na estaca.',
      'es':
          'Cuando se cultivan plantas con tallos flexibles, por ejemplo tomates, que tienden a caerse a medida que crecen, se recomienda sostenerlas con una estaca (ramita, palo de madera o bambú) para asegurar el soporte. También puedes atar un cordón de algodón para asegurar la planta a la estaca.',
    },
    'swisoixh': {
      'pt': 'Poda',
      'es': 'Poda',
    },
    'uggwoi6d': {
      'pt':
          '  Cortar as folhas secas, doentes ou machucadas deve ser um processo constante para que a planta não desperdice energia, água e nutrientes. Além disso, o processo ajuda na prevenção de pragas e doenças.',
      'es':
          'Cortar hojas secas, enfermas o lesionadas debe ser un proceso constante para que la planta no desperdicie energía, agua y nutrientes. Además, el proceso ayuda a prevenir plagas y enfermedades.',
    },
    'tyeu8v11': {
      'pt': 'Condução e Poda',
      'es': 'Conducción y poda',
    },
    'v6c3vb0z': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'jsquhtz7': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Rotacao
  {
    'zb7wr5k6': {
      'pt':
          '  \n  Após as colheitas, não se deve cultivar as mesmas espécies que foram plantadas anteriormente, visto que exigiriam do solo sempre os mesmos nutrientes. A escolha de plantas com características diferente garante que não ocorra a falta de um nutriente em específico, ou seja, garante que nenhum nutriente se esgote. E ainda, melhora a fertilidade do solo. Se havia folhosas, por exemplo, opte por cultivar raízes.\n\n  Para ajudar a melhorar a qualidade do solo, também pode ser interessante mudar a disposição da horta, ou até reconstruir, a cada ano. Lugares que serviam de passagem podem virar canteiros e assim por diante. Desse modo, conserva-se a biota (conjunto de todos os seres vivos de um determinado lugar) do subsolo.',
      'es':
          'Después de la cosecha, no se deben cultivar las mismas especies que se plantaron anteriormente, ya que siempre requerirían los mismos nutrientes del suelo. Elegir plantas con diferentes características asegura que no falte un nutriente específico, es decir, garantiza que ningún nutriente se agote. Además, mejora la fertilidad del suelo. Si hubiera maderas duras, por ejemplo, opte por que crezcan raíces.\n\n  Para ayudar a mejorar la calidad del suelo, también puede ser interesante cambiar la distribución del jardín, o incluso reconstruirlo, cada año. Los lugares que servían de pasillos pueden convertirse en parterres de flores, etc. De esta forma se preserva la biota (conjunto de todos los seres vivos de un lugar determinado) bajo tierra.',
    },
    'i9hs7xfd': {
      'pt': 'Rotação e mudança do local',
      'es': 'Rotación y cambio de ubicación.',
    },
    'dh91x8zw': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'kvveppby': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Colheita
  {
    'nqwmrn7u': {
      'pt':
          '   Cada espécie tem o seu tempo de colheita. Isso vai depender da planta cultivada, de seu estado nutricional e demais fatores como clima e quantidade de água disponível.\n  Os horários apropriados para a colheita são o começo da manhã ou fim da tarde. Recomenda-se evitar períodos mais secos e quentes do dia, quando as plantas perdem água.\n\n  Cada tipo tem um momento certo para ser colhido. Atente-se aos sinais:\n\n • Hortaliças folhosas: Preste atenção para não passarem do ponto, ficarem amareladas, amargas ou secas.\n\n • Hortaliças brássicas com inflorescência: Observe se os botões forais já estão formados e firmes.\n\n • Solanáceas: Confira se os frutos estão no tamanho e coloração desejados.',
      'es':
          'Cada especie tiene su propio momento de cosecha. Esto dependerá de la planta cultivada, su estado nutricional y otros factores como el clima y la cantidad de agua disponible.\n  Los momentos apropiados para la recolección son temprano en la mañana o al final de la tarde. Se recomienda evitar los periodos del día más secos y calurosos, cuando las plantas pierden agua.\n\n  Cada tipo tiene un momento adecuado para ser cosechado. Presta atención a las señales:\n\n • Verduras de hoja: Presta atención para que no se cocinen demasiado, se pongan amarillas, se amarguen o se sequen.\n\n • Brassicas con inflorescencias: Comprobar si las yemas forales ya están formadas y firmes.\n\n • Solanáceas: Comprobar si los frutos tienen el tamaño y color deseado.',
    },
    '448nw08g': {
      'pt': 'Colheita',
      'es': 'Cosecha',
    },
    'l18l85of': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'amo3hg31': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Compostagem
  {
    'ktr58lbp': {
      'pt':
          '  A compostagem, conhecida como processo de reciclagem e tratamento dos resíduos orgânicos, transforma matéria orgânica em adubo natural, substituindo o uso de produtos químicos.\n\n  É um processo biológico em que microrganismos transformam a matéria orgânica em composto, adubo natural semelhante ao solo.\n\n  Uma boa compostagem depende de alguns fatores como umidade, temperatura, aeração (nível de oxigênio) e balanço de nutrientes. O controle de tais fatores favorece que macroorganismos (como minhocas e insetos) e microrganismos (como fungos e bactérias), atuem na acelerada degradação da matéria orgânica. No final do processo, os resíduos transformam-se no chamado composto orgânico, que pode ser utilizado diretamente no solo, até mesmo para auxiliar a recuperação de áreas degradadas.\n',
      'es':
          'El compostaje, conocido como el proceso de reciclaje y tratamiento de residuos orgánicos, transforma la materia orgánica en fertilizante natural, sustituyendo el uso de productos químicos.\n\n  Es un proceso biológico en el que los microorganismos transforman la materia orgánica en compost, un fertilizante natural similar al suelo.\n\n  Un buen compostaje depende de algunos factores como la humedad, la temperatura, la aireación (nivel de oxígeno) y el equilibrio de nutrientes. El control de tales factores favorece que macroorganismos (como gusanos e insectos) y microorganismos (como hongos y bacterias) actúen en la degradación acelerada de la materia orgánica. Al final del proceso, los residuos se transforman en el llamado compuesto orgánico, que puede ser aprovechado directamente en el suelo, incluso para ayudar a recuperar zonas degradadas.',
    },
    'jhcuycnb': {
      'pt': 'Compostagem',
      'es': 'compostaje',
    },
    '4egb02ld': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'wxkxg681': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Seguranca
  {
    'zr81crj0': {
      'pt':
          ' •  Quebra vento ou cerca viva: plantas como o café e a bananeira podem ser usados como barreiras naturais contra ventos fortes, ataque de insetos e disseminação de fungos. Ainda são capazes de atrair polinizadores e inimigos naturais, manter a umidade e a temperatura.\n\n •  Consórcio e plantas companheiras: algumas espécies quando cultivadas juntas produzem benefícios entre si. A isso, dá-se o nome de consórcio ou o termo “plantas companheiras”. Podem se ajudar afastando pragas e atraindo polinizadores, como o manjericão e o alecrim. Plantas mais altas também são capazes de gerar sombra para companheiras que precisam de proteção contra o sol.',
      'es':
          '• Cortavientos o seto: plantas como el cafeto y el plátano se pueden utilizar como barreras naturales contra los fuertes vientos, el ataque de insectos y la propagación de hongos. Todavía pueden atraer polinizadores y enemigos naturales, mantener la humedad y la temperatura.\n\n • Cultivos intercalados y plantas asociadas: algunas especies, cuando se cultivan juntas, se benefician mutuamente. A esto se le llama consorcio o el término “plantas complementarias”. Pueden ayudarse mutuamente manteniendo alejadas las plagas y atrayendo polinizadores, como la albahaca y el romero. Las plantas más altas también son capaces de generar sombra para los compañeros que necesitan protección del sol.',
    },
    'q4rrs3uy': {
      'pt': 'Segurança',
      'es': 'Seguridad',
    },
    'kk85om30': {
      'pt': 'Guia de manutenção',
      'es': 'Guía de mantenimiento',
    },
    'zdv1noq7': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Dicas
  {
    'qfzl9ezn': {
      'pt':
          ' • Lembre-se que as ferramentas precisam ser limpas após o uso. Isso contribui para não levar doenças de uma planta a outra.\n\n • Para garantir o desenvolvimento das plantas, é importante se certificar de que não há obstáculos que produzam sombra, como muros e prédios vizinhos. Árvores grandes também podem bloquear a  • incidência de sol, mas como elas abrigam pássaros, é útil tê-las por perto para o controle de insetos.\n\n • Para colher as hortaliças, retire folha por folha, em vez de arrancar o pé inteiro. Assim, elas continuarão produzindo.\n\n • Evite encharcar o solo nas irrigações, pois isso cria um ambiente favorável ao ataque de fungos. A falta de água, por outro lado, pode prejudicar o desenvolvimento das plantas. \n\n • Quando as plantas são irrigadas em períodos mais espaçados, suas raízes se tornam mais fortes e resistentes à seca, porque se aprofundam mais no solo em busca de água.\n\n • Um estudo da pesquisadora Maria de Lourdes Soffner (2001) mostrou que a folha de bananeira e o seu pseudocaule usado como cobertura ou incorporados ao solo mantêm a umidade, evitam a erosão, controlam plantas invasoras e devolvem nutrientes à terra, reduzindo os custos com adubação.\n\n • Se observar que alguma planta mudou de cor, murchou, secou ou está apresentando deformidades nas folhas, caule ou raiz, retire-a da horta para evitar a possível disseminação de alguma doença.\n',
      'es':
          '• Recuerde que las herramientas deben limpiarse después de su uso. Esto ayuda a evitar la propagación de enfermedades de una planta a otra.\n\n • Para garantizar el desarrollo de las plantas, es importante asegurarse de que no existan obstáculos que produzcan sombra, como paredes y edificios vecinos. Los árboles grandes también pueden bloquear la luz solar, pero como albergan a las aves, es útil tenerlos cerca para controlar los insectos.\n\n • Para cosechar hortalizas, retire hoja por hoja, en lugar de arrancar todo el tallo. De esta manera seguirán produciendo.\n\n • Evite remojar la tierra al regar, ya que esto crea un ambiente favorable al ataque de hongos. La falta de agua, por el contrario, puede perjudicar el desarrollo de las plantas.\n\n • Cuando las plantas se riegan a intervalos más largos, sus raíces se vuelven más fuertes y resistentes a la sequía, porque profundizan en el suelo en busca de agua.\n\n • Un estudio de la investigadora María de Lourdes Soffner (2001) demostró que la hoja de plátano y su pseudotallo utilizado como cobertura o incorporado al suelo mantienen la humedad, previenen la erosión, controlan las plantas invasoras y devuelven nutrientes a la tierra, reduciendo costos con la fertilización.\n\n • Si notas que alguna planta ha cambiado de color, se ha marchitado, secado o tiene deformidades en las hojas, tallo o raíces, retírala del jardín para evitar el posible contagio de alguna enfermedad.',
    },
    'ez2l36b6': {
      'pt': 'Dicas',
      'es': 'Consejos',
    },
    'sd7l2m2y': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // PragaseDoencas
  {
    '04fgt2ai': {
      'pt': 'Guia sobre pragas e doenças',
      'es': 'Guía de plagas y enfermedades.',
    },
    '1wp8iu60': {
      'pt': 'Cuidados com a horta',
      'es': 'cuidado del jardín',
    },
    'nstzleww': {
      'pt': 'Presença de insetos',
      'es': 'Presencia de insectos',
    },
    'xykro5mz': {
      'pt': 'Plantas doentes',
      'es': 'Plantas enfermas',
    },
    'dh9b540x': {
      'pt': 'Tabela de doenças',
      'es': 'tabla de enfermedades',
    },
    'k2ybcbqh': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    'bt9r1x1r': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'xrlphrpm': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    '53xk1wyi': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    '1r3fdpxc': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'etxjvc12': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    '7yy4g6fy': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    'qtuc9gcc': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'w4jl4bp1': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Insetos
  {
    'j8ibkp45': {
      'pt':
          '  Tenha em mente que os insetos serão sim parte de sua horta, mas nem todos são prejudiciais às plantas. Na verdade, muitos contribuem por meio da polinização e controle de pragas.\n\n  O segredo é ficar atento e buscar um equilíbrio. Se ocorrer o aumento de um só tipo de inseto na mesma planta, pode indicar desiquilíbrio. Nessa situação, pode-se tomar medidas inofensivas às plantas e aos seres humanos.\nExemplos de insetos bem comuns em hortas são as lagartas, pulgões e cochonilha.\n\n  Uma estratégia simples e que podem ser utilizadas com êxito, são controlar insetos sensíveis a odores com plantas aromáticas. Espécies como pimenta e gergelim podem manter longe alguns insetos indesejados.\nÉ possível que uma doença ou infestação tome proporções mais graves, tornando necessário a intervenção de remédios naturais.',
      'es':
          'Ten en cuenta que los insectos formarán parte de tu jardín, pero no todos son dañinos para las plantas. De hecho, muchos contribuyen mediante la polinización y el control de plagas.\n\n  El secreto es mantenerse alerta y buscar el equilibrio. Si hay un aumento de un solo tipo de insecto en una misma planta, puede indicar un desequilibrio. En esta situación se pueden tomar medidas que sean inofensivas para las plantas y los seres humanos.\nEjemplos de insectos muy comunes en los huertos son las orugas, el pulgón y la cochinilla.\n\n  Una estrategia sencilla que se puede utilizar con éxito es controlar los insectos sensibles a los olores con plantas aromáticas. Especies como la pimienta y el sésamo pueden mantener alejados a algunos insectos no deseados.\nEs posible que una enfermedad o infestación adquiera proporciones más graves, siendo necesario recurrir a remedios naturales.',
    },
    'mibu22hb': {
      'pt': 'Presença de insetos',
      'es': 'Presencia de insectos',
    },
    '675fvyoj': {
      'pt': 'Guia de pragas e doenças',
      'es': 'guía de plagas y enfermedades',
    },
    'a0ong4nt': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // PlantasDoentes
  {
    'yh57rpq6': {
      'pt':
          ' Assim como os animais, na falta de um local favorável e nutrição adequada, as plantas podem adoecer e manifestar sintomas.\n\n As causas e manifestações podem ser diversas. Por exemplo, causas como: excesso ou falta de água ou sol, excesso de vento, presença de vírus e/ou bactérias. E sintomas como: mudanças no aspecto e cor, secar, murchar e deformidades.\n\n Veja os principais sinais, causas e recomendações abaixo:',
      'es':
          'Al igual que los animales, en ausencia de un lugar favorable y de una nutrición adecuada, las plantas pueden enfermarse y mostrar síntomas.\n\n Las causas y manifestaciones pueden ser diversas. Por ejemplo, causas como: exceso o falta de agua o sol, exceso de viento, presencia de virus y/o bacterias. Y síntomas como: cambios de apariencia y color, resequedad, marchitez y deformidades.\n\n Vea los principales signos, causas y recomendaciones a continuación:',
    },
    'acrtox8e': {
      'pt': 'Plantas Doentes',
      'es': 'Plantas enfermas',
    },
    'wocpikvq': {
      'pt': 'Guia de pragas e doenças',
      'es': 'guía de plagas y enfermedades',
    },
    '2c5en9pz': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // TabelasDoencas
  {
    'ibi14jm2': {
      'pt': 'Tabelas de doenças',
      'es': 'Tablas de enfermedades',
    },
    'tuzf4np1': {
      'pt': 'Guia de pragas e doenças',
      'es': 'guía de plagas y enfermedades',
    },
    'hc1bvmh5': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // DetalhesPlantaseditar
  {
    'k17fejdc': {
      'pt': 'Escolher foto',
      'es': 'Escoge una foto',
    },
    '0r4dam5r': {
      'pt': 'Nome: ',
      'es': 'Nombre:',
    },
    'hmfvwvck': {
      'pt': 'Salvar',
      'es': 'Ahorrar',
    },
    'uwz3lv1u': {
      'pt': 'Excluir planta',
      'es': 'Eliminar planta',
    },
    '1vz4wdis': {
      'pt': '',
      'es': '',
    },
  },
  // DetalhesPlantasUsuario
  {
    'dsyza2dh': {
      'pt': 'Nome: ',
      'es': 'Nombre:',
    },
    'qasrba92': {
      'pt': 'Quero plantar!',
      'es': '¡Quiero plantar!',
    },
    'rkzcvnv2': {
      'pt': 'Editar',
      'es': 'Para editar',
    },
    'vgc17fcx': {
      'pt': '',
      'es': '',
    },
  },
  // Suporte
  {
    'cqr87rbp': {
      'pt': 'Bem-vindo ao suporte!',
      'es': '¡Bienvenido al soporte!',
    },
    'f1q4rkt5': {
      'pt': 'Como podemos ajudar?',
      'es': '¿Cómo podemos ayudar?',
    },
    'vdtthoot': {
      'pt': 'Enviar email',
      'es': 'Enviar correo electrónico',
    },
    '0sr2wly1': {
      'pt': 'Acesse o site',
      'es': 'Accede al sitio web',
    },
    'zciqpqca': {
      'pt': 'Suporte',
      'es': 'Soporte',
    },
    'je7zq699': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // HortalicasCopy
  {
    'v628fttv': {
      'pt': 'Início',
      'es': 'Comenzar',
    },
    'k99au8td': {
      'pt': 'Conheça as hortaliças',
      'es': 'Descubre las verduras',
    },
    'kp4ju127': {
      'pt': 'Notícias',
      'es': 'Noticias',
    },
    'a3v8p8b4': {
      'pt': 'Gerenciamento',
      'es': 'Gestión',
    },
    'uie5hnzv': {
      'pt': 'Configurações',
      'es': 'ajustes',
    },
    'tb3cjdna': {
      'pt': 'Acessar conta',
      'es': 'Acceder a la cuenta',
    },
    '68elzfah': {
      'pt': 'Sair da conta',
      'es': 'Cerrar sesión en la cuenta',
    },
    'ozrtdaex': {
      'pt': 'Sobre o app',
      'es': 'Acerca de la aplicación',
    },
    'zc08zb3a': {
      'pt': 'Home',
      'es': 'Hogar',
    },
  },
  // Miscellaneous
  {
    'kx3zgodc': {
      'pt': '',
      'es': '',
    },
    'u2714uae': {
      'pt': '',
      'es': '',
    },
    'bq117i3c': {
      'pt': 'Permitir que este aplicativo envie notificações',
      'es': '',
    },
    'rba80z4g': {
      'pt': '',
      'es': '',
    },
    'lhkml5t3': {
      'pt': '',
      'es': '',
    },
    'dci8wsiw': {
      'pt': '',
      'es': '',
    },
    's0f4tx3z': {
      'pt': '',
      'es': '',
    },
    '0rxybuw3': {
      'pt': '',
      'es': '',
    },
    'lz96tkf4': {
      'pt': '',
      'es': '',
    },
    '9to6dsz5': {
      'pt': '',
      'es': '',
    },
    '9rj80l8e': {
      'pt': '',
      'es': '',
    },
    '2lirdhvk': {
      'pt': '',
      'es': '',
    },
    '0i6jse7q': {
      'pt': '',
      'es': '',
    },
    'spgcbvma': {
      'pt': '',
      'es': '',
    },
    'bfcpg665': {
      'pt': '',
      'es': '',
    },
    '51dhx6d8': {
      'pt': '',
      'es': '',
    },
    'tpvrf7q0': {
      'pt': '',
      'es': '',
    },
    '3t2ycbdh': {
      'pt': '',
      'es': '',
    },
    'mpgrylhn': {
      'pt': '',
      'es': '',
    },
    '1ilucv9j': {
      'pt': '',
      'es': '',
    },
    '0cniwkl2': {
      'pt': '',
      'es': '',
    },
    'uluizrjv': {
      'pt': '',
      'es': '',
    },
    'q2xrgetx': {
      'pt': '',
      'es': '',
    },
    'pmcd37cr': {
      'pt': '',
      'es': '',
    },
    '7bd5dtry': {
      'pt': '',
      'es': '',
    },
    't5d26mfe': {
      'pt': '',
      'es': '',
    },
    'mou15zti': {
      'pt': '',
      'es': '',
    },
    'ig2t8xpa': {
      'pt': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
