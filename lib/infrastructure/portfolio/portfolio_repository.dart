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
          'Busca preservar el capital y maximizar los rendimientos de los inversionistas, manteniendo principalmente inversiones en t??tulos de renta fija.',
      icon: 'CredicorpCapital.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'm??n. 0%  - max. 100% '),
      ]),
      link:
          'https://www.credicorpcapitalcolombia.com/Gestion_de_Activos/Fondos_Locales/fonval',
      type: 'Fondo de inversi??n colectiva abierto sin pacto de permanencia',
    ));

    //Credicorp2
    list.add(PortfolioDetail(
      description:
          'Busca oportunidades de inversi??n o desinversi??n en acciones del mercado accionario colombiano, mercado MILA y Mercado Global colombiano.',
      icon: 'CredicorpCapital.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Variable: Acciones', distribution: 'm??n. 40%'),
        PortfolioInvestment(title: 'Renta Fija', distribution: 'm??x. 40% '),
      ]),
      link:
          'https://www.skandia.com.co/quienes-somos/skandia-en-colombia/skandia-fiduciaria-S-A/fondo-inversiones-colectivas/Perfil-Conservador/Skandia-Efectivo/Paginas/default.aspx',
      type: 'Fondo de inversi??n colectiva abierto sin pacto de permanencia',
    ));

    //Skandia1
    list.add(PortfolioDetail(
      description:
          'Es un fondo colectivo abierto, enfocado en inversiones de baja volatilidad y corto plazo.',
      icon: 'skandia.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'm??n. 40% - m??x. 100%'),
        PortfolioInvestment(
            title: 'Dep??sito a la vista', distribution: 'm??n. 0& - m??x. 40% '),
      ]),
      link:
          'https://www.skandia.com.co/quienes-somos/skandia-en-colombia/skandia-fiduciaria-S-A/fondo-inversiones-colectivas/Perfil-Conservador/Skandia-Efectivo/Paginas/default.aspx',
      type: 'Fondo de inversi??n colectiva abierto sin pacto de permanencia',
    ));

    //BTGPactual1
    list.add(PortfolioDetail(
      description:
          'Ofrece un instrumento de inversi??n de largo plazo en el mercado de Renta Variable Colombiano. Compuesto en su mayor parte por acciones.',
      icon: 'btgActual.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Acciones', distribution: 'm??n. 70% - m??x. 100%'),
        PortfolioInvestment(title: 'Otros', distribution: 'm??n. 0% - m??x. 30%'),
      ]),
      link: 'https://www.btgpactual.com.co/historico-acciones-colombia/ ',
      type: 'Fondo de inversi??n colectiva abierto con pacto de permanencia',
    ));

    //Alianza1
    list.add(PortfolioDetail(
      description:
          'Invierte en instrumentos de renta fija de emisores locales e internacionales, que tengan calificaci??n crediticia.',
      icon: '1.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'm??n. 100% - m??x. 100%'),
      ]),
      link: 'https://www.alianza.com.co/fondo-alianza-liquidez-dolar#column-3',
      type: 'Fondo de inversi??n colectiva abierto con pacto de permanencia ',
    ));

    //Fiduoccidente1
    list.add(PortfolioDetail(
      description:
          'Invierte en una cartera de bajo riesgo, con una alta participaci??n en activos de corto plazo',
      icon: 'FiduciariaOccidente.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'm??n. 0% - m??x. 100%'),
        PortfolioInvestment(
            title: 'Renta Variable', distribution: 'm??n. 0% - m??x. 10%'),
      ]),
      link:
          'https://www.fiduoccidente.com/wps/portal/fiduciaria-occidente/fiduoccidente/fiducia-inversion/fondos-inversion-colectiva/occirenta',
      type: 'Fondo de inversi??n colectiva abierto sin pacto de permanencia',
    ));

    //Fiduoccidente2
    list.add(PortfolioDetail(
      description:
          'Ofrece una alternativa de inversi??n balanceada con exposici??n a mercados internacionales.',
      icon: 'FiduciariaOccidente.png',
      investments: KtList.from(<PortfolioInvestment>[
        PortfolioInvestment(
            title: 'Renta Fija', distribution: 'm??n. 0% - m??x. 70%'),
        PortfolioInvestment(
            title: 'Renta Variable', distribution: 'm??n. 0% - m??x. 90%'),
      ]),
      link:
          'https://www.fiduoccidente.com/wps/portal/fiduciaria-occidente/fiduoccidente/fiducia-inversion/fondos-inversion-colectiva/balanceado',
      type: 'Fondo de inversi??n colectiva abierto con pacto de permanencia',
    ));

    return Future.delayed(Duration(seconds: 1), () => right(KtList.from(list)));
  }

  KtList<PortfolioDescriptionInvest> _descriptionInvest(int index) {
    List<PortfolioDescriptionInvest> list = new List();

    switch (index) {
      case 46: //SK-DCP
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija', subTitle: 'm??n. 80%'));
        list.add(PortfolioDescriptionInvest(
            title: '??ndice de Referencia', subTitle: 'PiPCetes. 28d'));
        break;
      case 47: //SK-RVMX
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija', subTitle: 'm??n. 80%'));
        list.add(PortfolioDescriptionInvest(
            title: '??ndice de Referencia',
            subTitle: '??ndice de Precios y Cotizaciones'));
        break;
      case 48: //SK-RVST
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Variable Internacional', subTitle: 'm??n. 80%'));
        list.add(PortfolioDescriptionInvest(
            title: '??ndice de Referencia',
            subTitle: 'MSCI ACWI (All Country World Index) Index '));
        break;
      case 49: //SK-DEST
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija',
            subTitle:
                'Deuda gubernamental, estatal, municipal, corporativa o bancaria, nacionales y extranjeros y con calidad crediticia m??nima A'));
        list.add(PortfolioDescriptionInvest(
            title: '??ndice de Referencia',
            subTitle: '75%:  PiPCetes-28d \n25%: PiPG-Fix10A'));
        break;
      case 50: //SURUDI
        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de f??cil realizaci??n y/o valores con vencimiento menor a 3 meses',
            subTitle: 'm??n. 5% - m??x. 100%'));
        list.add(PortfolioDescriptionInvest(
            title: 'Valores de nominados en UDIS',
            subTitle: 'm??n. 80% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores emitidos o avalados por el Gobierno Federal Mexicano y/o a trav??s de mecanismos de inversi??n colectiva',
            subTitle: 'm??n. 51% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Instrumentos financieros derivados',
            subTitle: 'm??n. 0% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Dep??sitos bancarios de dinero a la vista en entidades financieras (inclusive del exterior) y reporto.',
            subTitle: 'm??n. 0% - m??x. 20%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Acciones de Fondos de Inversi??n',
            subTitle: 'm??n. 0% - m??x. 20%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Mecanismos de inversi??n colectiva (ETFs & Trackers)',
            subTitle: 'm??n. 0% - m??x. 20%'));
        break;
      case 51: //SURVEURBM
        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de f??cil realizaci??n y/o valores con vencimiento menor a 3 meses',
            subTitle: 'm??n. 10% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Multimonedas (Se refiere a la exposici??n que no deriva de pesos o UDIS)',
            subTitle: 'm??n. 80% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de renta variable nacional e internacional de manera directa o por medio de ETFs, TRACs y/o Fondos de inversi??n',
            subTitle: 'm??n. 80% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Acciones de emisoras del continente europeo, de manera directa o por meido de ETFs y/o Fondos de Inversi??n',
            subTitle: 'm??n. 80% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Mecanismos de Inversi??n colectiva (ETFs & TRAC)',
            subTitle: 'm??n. 0% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Instrumentos financieros derivados con base en su valor nacional',
            subTitle: 'm??n. 0% - m??x. 50%'));
        break;
      case 52: //NTEMPG M7
        list.add(PortfolioDescriptionInvest(
            title: 'Renta Fija Gubernamental',
            subTitle: 'm??n. 90% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Activos objeto Inversi??n gubernamental en UDIS',
            subTitle: 'm??n. 0% - m??x. 10%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Reportos', subTitle: 'm??n. 0% - m??x. 40%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Valores de F??cil realizaci??n',
            subTitle: 'm??n. 20% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Valores gubernamentales', subTitle: 'm??n. 0% - m??x. 100%'));
        break;
      case 53: //SCOTIAGM4

        list.add(PortfolioDescriptionInvest(
            title: '??ndice de Referencia',
            subTitle: '100% S&P/BWV Sovereign Funding Rate Bond Index'));

        list.add(PortfolioDescriptionInvest(
            title: 'Valores gubernamentales', subTitle: 'm??n. 0% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Fondo de inversi??n en valores Guber',
            subTitle: 'm??n. 0% - m??x. 50%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores gubernamentales denominados en UDIs y monedas extranjeras',
            subTitle: 'm??n. 0% - m??x. 20%'));

        list.add(PortfolioDescriptionInvest(
            title:
                'Valores de f??cil realizaci??n y/o valores con plazo de vencimiento menor a 3 meses',
            subTitle: 'm??n. 30% - m??x. 100%'));

        list.add(PortfolioDescriptionInvest(
            title: 'Operaciones de Reporto', subTitle: 'm??n. 0% - m??x. 100%'));
        break;
      default:
    }

    return KtList.from(list);
  }
}
