import 'package:ualet/domain/portfolio/portfolio_description_invest.dart';
import 'package:ualet/to_be_refactor/utils/config/configuration.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:ualet/domain/core/base_failures.dart';
import 'package:ualet/domain/portfolio/i_portfolio_repository.dart';
import 'package:ualet/domain/portfolio/portfolio_detail.dart';
import 'package:ualet/domain/portfolio/portfolio_investment.dart';

@LazySingleton(as: IPortfolioRepository)
class PortfolioRepository implements IPortfolioRepository {
  final Dio _dio;

  PortfolioRepository(this._dio);

  final apiFunds = "/User/GetFundAssigned";

  @override
  Future<Either<BaseFailure, KtList<PortfolioDetail>>> getDetails() async {
    try {
      List<PortfolioDetail> funds = [];
      var fundsData = await _dio.get(apiFunds);
      for (Map fundJson in fundsData.data["Data"]) {
        List<PortfolioInvestment> investments = [];
        for (var inv in fundJson['assetType']) {
          investments.add(PortfolioInvestment(
              title: inv['Description'], distribution: inv['detail']));
        }
        PortfolioDetail fund = PortfolioDetail(
            description: fundJson['Terms'],
            icon: fundJson['Logo'],
            investments: KtList.from(investments),
            link: fundJson['DataSheet'],
            descriptionInvest: _descriptionInvest(fundJson['FoundId']),
            type: fundJson['FoundName']);

        funds.add(fund);
      }
      return right(KtList.from(funds));
    } catch (e) {
      print("ERROR getFunds()==========================================");
      print(e);
      return left(BaseFailure.unexpected());
    }
  }

  Future<Either<BaseFailure, KtList<PortfolioDetail>>> _getDetailsMock() async {
    List<PortfolioDetail> list = new List();
    //Credicorp 1
    list.add(PortfolioDetail(
      description:
          'Busca preservar el capital y maximizar los rendimientos de los inversionistas, manteniendo principalmente inversiones en títulos de renta fija.',
      icon: 'CredicorpCapital.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'mín. 0%  - max. 100% '),
      ]),
      link:
          'https://www.credicorpcapitalcolombia.com/Gestion_de_Activos/Fondos_Locales/fonval',
      type: 'Fondo de inversión colectiva abierto sin pacto de permanencia',
    ));

    //Credicorp2
    list.add(PortfolioDetail(
      description:
          'Busca oportunidades de inversión o desinversión en acciones del mercado accionario colombiano, mercado MILA y Mercado Global colombiano.',
      icon: 'CredicorpCapital.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Variable: Acciones', distribution: 'mín. 40%'),
        PortfolioInvestment(title: 'Renta Fija', distribution: 'máx. 40% '),
      ]),
      link:
          'https://www.skandia.com.co/quienes-somos/skandia-en-colombia/skandia-fiduciaria-S-A/fondo-inversiones-colectivas/Perfil-Conservador/Skandia-Efectivo/Paginas/default.aspx',
      type: 'Fondo de inversión colectiva abierto sin pacto de permanencia',
    ));

    //Skandia1
    list.add(PortfolioDetail(
      description:
          'Es un fondo colectivo abierto, enfocado en inversiones de baja volatilidad y corto plazo.',
      icon: 'skandia.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'mín. 40% - máx. 100%'),
        PortfolioInvestment(
            title: 'Depósito a la vista', distribution: 'mín. 0& - máx. 40% '),
      ]),
      link:
          'https://www.skandia.com.co/quienes-somos/skandia-en-colombia/skandia-fiduciaria-S-A/fondo-inversiones-colectivas/Perfil-Conservador/Skandia-Efectivo/Paginas/default.aspx',
      type: 'Fondo de inversión colectiva abierto sin pacto de permanencia',
    ));

    //BTGPactual1
    list.add(PortfolioDetail(
      description:
          'Ofrece un instrumento de inversión de largo plazo en el mercado de Renta Variable Colombiano. Compuesto en su mayor parte por acciones.',
      icon: 'btgActual.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Acciones', distribution: 'mín. 70% - máx. 100%'),
        PortfolioInvestment(title: 'Otros', distribution: 'mín. 0% - máx. 30%'),
      ]),
      link: 'https://www.btgpactual.com.co/historico-acciones-colombia/ ',
      type: 'Fondo de inversión colectiva abierto con pacto de permanencia',
    ));

    //Alianza1
    list.add(PortfolioDetail(
      description:
          'Invierte en instrumentos de renta fija de emisores locales e internacionales, que tengan calificación crediticia.',
      icon: '1.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'mín. 100% - máx. 100%'),
      ]),
      link: 'https://www.alianza.com.co/fondo-alianza-liquidez-dolar#column-3',
      type: 'Fondo de inversión colectiva abierto con pacto de permanencia ',
    ));

    //Fiduoccidente1
    list.add(PortfolioDetail(
      description:
          'Invierte en una cartera de bajo riesgo, con una alta participación en activos de corto plazo',
      icon: 'FiduciariaOccidente.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'mín. 0% - máx. 100%'),
        PortfolioInvestment(
            title: 'Renta Variable', distribution: 'mín. 0% - máx. 10%'),
      ]),
      link:
          'https://www.fiduoccidente.com/wps/portal/fiduciaria-occidente/fiduoccidente/fiducia-inversion/fondos-inversion-colectiva/occirenta',
      type: 'Fondo de inversión colectiva abierto sin pacto de permanencia',
    ));

    //Fiduoccidente2
    list.add(PortfolioDetail(
      description:
          'Ofrece una alternativa de inversión balanceada con exposición a mercados internacionales.',
      icon: 'FiduciariaOccidente.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'mín. 0% - máx. 70%'),
        PortfolioInvestment(
            title: 'Renta Variable', distribution: 'mín. 0% - máx. 90%'),
      ]),
      link:
          'https://www.fiduoccidente.com/wps/portal/fiduciaria-occidente/fiduoccidente/fiducia-inversion/fondos-inversion-colectiva/balanceado',
      type: 'Fondo de inversión colectiva abierto con pacto de permanencia',
    ));

    return Future.delayed(Duration(seconds: 1), () => right(KtList.from(list)));
  }

  KtList<PortfolioDescriptionInvest> _descriptionInvest(int index) {
    List<PortfolioDescriptionInvest> list = new List();

    switch (index) {
      case 46: //SK-DCP
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija', subTitle: 'mín. 80%'));
        list.add(PortfolioDescriptionInvest(
            title: 'Índice de Referencia', subTitle: 'PiPCetes. 28d'));
        break;
      case 47: //SK-RVMX
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija', subTitle: 'mín. 80%'));
        list.add(PortfolioDescriptionInvest(
            title: 'Índice de Referencia',
            subTitle: 'Índice de Precios y Cotizaciones'));
        break;
      case 48: //SK-RVST
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Variable Internacional', subTitle: 'mín. 80%'));
        list.add(PortfolioDescriptionInvest(
            title: 'Índice de Referencia',
            subTitle: 'MSCI ACWI (All Country World Index) Index '));
        break;
      case 49: //SK-DEST
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija',
            subTitle:
                'Deuda gubernamental, estatal, municipal, corporativa o bancaria, nacionales y extranjeros y con calidad crediticia mínima A'));
        list.add(PortfolioDescriptionInvest(
            title: 'Índice de Referencia',
            subTitle: '75%:  PiPCetes-28d \n25%: PiPG-Fix10A'));
        break;
      case 50: //SURUDI
        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de fácil realización y/o valores con vencimiento menor a 3 meses',
            subTitle: 'mín. 5% - máx. 100%'));
        list.add(PortfolioDescriptionInvest(
            title: 'Valores de nominados en UDIS',
            subTitle: 'mín. 80% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores emitidos o avalados por el Gobierno Federal Mexicano y/o a través de mecanismos de inversión colectiva',
            subTitle: 'mín. 51% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Instrumentos financieros derivados',
            subTitle: 'mín. 0% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Depósitos bancarios de dinero a la vista en entidades financieras (inclusive del exterior) y reporto.',
            subTitle: 'mín. 0% - máx. 20%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Acciones de Fondos de Inversión',
            subTitle: 'mín. 0% - máx. 20%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Mecanismos de inversión colectiva (ETFs & Trackers)',
            subTitle: 'mín. 0% - máx. 20%'));
        break;
      case 51: //SURVEURBM
        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de fácil realización y/o valores con vencimiento menor a 3 meses',
            subTitle: 'mín. 10% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Multimonedas (Se refiere a la exposición que no deriva de pesos o UDIS)',
            subTitle: 'mín. 80% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de renta variable nacional e internacional de manera directa o por medio de ETFs, TRACs y/o Fondos de inversión',
            subTitle: 'mín. 80% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Acciones de emisoras del continente europeo, de manera directa o por meido de ETFs y/o Fondos de Inversión',
            subTitle: 'mín. 80% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Mecanismos de Inversión colectiva (ETFs & TRAC)',
            subTitle: 'mín. 0% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Instrumentos financieros derivados con base en su valor nacional',
            subTitle: 'mín. 0% - máx. 50%'));
        break;
      case 52: //NTEMPG M7
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija Gubernamental',
            subTitle: 'mín. 90% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Activos objeto Inversión gubernamental en UDIS',
            subTitle: 'mín. 0% - máx. 10%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Reportos', subTitle: 'mín. 0% - máx. 40%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Valores de Fácil realización',
            subTitle: 'mín. 20% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Valores gubernamentales', subTitle: 'mín. 0% - máx. 100%'));
        break;
      case 53: //SCOTIAGM4

        list.add(PortfolioDescriptionInvest(
            title: 'Índice de Referencia',
            subTitle: '100% S&P/BWV Sovereign Funding Rate Bond Index'));

        list.add(PortfolioDescriptionInvest(
            title: 'Valores gubernamentales', subTitle: 'mín. 0% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Fondo de inversión en valores Guber',
            subTitle: 'mín. 0% - máx. 50%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores gubernamentales denominados en UDIs y monedas extranjeras',
            subTitle: 'mín. 0% - máx. 20%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de fácil realización y/o valores con plazo de vencimiento menor a 3 meses',
            subTitle: 'mín. 30% - máx. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Operaciones de Reporto', subTitle: 'mín. 0% - máx. 100%'));
        break;
      default:
    }

    return KtList.from(list);
  }
}
