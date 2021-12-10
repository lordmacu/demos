import 'dart:convert';

SliderPortfolio sliderPortfolioFromJson(String str) => SliderPortfolio.fromJson(json.decode(str));

String sliderPortfolioToJson(SliderPortfolio data) => json.encode(data.toJson());

class SliderPortfolio {
    SliderPortfolio({
      this.name,
      this.description,
      this.type,
      this.folder,
      this.img,
      this.rent,
    });

    String name;
    String description;
    String type;
    String folder;
    String img;
    List<Rent> rent;

    factory SliderPortfolio.fromJson(Map<String, dynamic> json) => SliderPortfolio(
      name: json["name"],
      description: json["description"],
      type: json["type"],
      folder: json["folder"],
      img: json["img"],
      rent: List<Rent>.from(json["rent"].map((x) => Rent.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      "name": name,
      "description": description,
      "type": type,
      "folder": folder,
      "img": img,
      "rent": List<dynamic>.from(rent.map((x) => x.toJson())),
    };
}

class Rent {
    Rent({
        this.nameRent,
    });

    String nameRent;

    factory Rent.fromJson(Map<String, dynamic> json) => Rent(
      nameRent: json["nameRent"],
    );

    Map<String, dynamic> toJson() => {
      "nameRent": nameRent,
    };
}

final sliderPortfolioList = [
  SliderPortfolio(
    name: "FIC Fonval",
    description: "Busca preservar el capital y maximizar los rendimientos de los inversionistas, manteniendo principalmente inversiones en títulos de renta fija.",
    type: "Fondo de Inversión Colectiva abierto sin pacto de permanencia",
    folder: "portfolio",
    img: "credicorpcapital",
    rent: [
      Rent(
        nameRent: "Renta Fija"
      )
    ]
  ),
  SliderPortfolio(
    name: "FIC Fonval Acciones Dinámico",
    description: "Busca oportunidades de inversión o desinversión en acciones del mercado accionario colombiano, mercado MILA y Mercado Global colombiano.",
    type: "Fondo de Inversión Colectiva abierto sin pacto de permanencia",
    folder: "portfolio",
    img: "credicorpcapital",
    rent: [
      Rent(
        nameRent: "Renta Fija"
      ),
      Rent(
        nameRent: "Depósito a la vista"
      )
    ]
  ),
  SliderPortfolio(
    name: "FIC Old Mutual Efectivo",
    description: "Es un fondo colectivo abierto, enfocado en inversiones de baja volatilidad y corto plazo.",
    type: "Fondo de inversión collectiva abierto sin pacto de permanencia",
    folder: "portfolio",
    img: "skandia",
    rent: [
      Rent(
        nameRent: "Renta Fija",
      ),
      Rent(
        nameRent: "Depósito a la vista",
      )
    ]
  ),
  SliderPortfolio(
    name: "FIC BGT Pactual Acciones Colombia",
    description: "Ofrece un instrumento de inversión de largo plazo en el mercado de Renta Variable Colombiano. Compuesto en su mayor parte por acciones.",
    type: "Fondo de Inversión colectiva abierto con pacto de permanencia",
    folder: "portfolio",
    img: "bgtpactual",
    rent: [
      Rent(
        nameRent: "Acciones",
      ),
      Rent(
        nameRent: "Otros",
      )
    ]
  ),
  SliderPortfolio(
    name: "Fondo Alianza Renta Fija Global",
    description: "Invierte en instrumentos de renta fija de emisores locales e internacionales, que tengan calificación crediticia.",
    type: "Fondo de inversión colectiva abierto con pacto de pertenencia",
    folder: "portfolio",
    img: "alianza",
    rent: [
      Rent(
        nameRent: "Renta Fija Local"
      ),
      Rent(
        nameRent: "Renta Fija Internacional"
      )
    ]
  ),
  SliderPortfolio(
    name: "FIC Occidenta",
    description: "Invierte en una cartera de bajo riesgo, con una alta participación en activos de corto plazo.",
    type: "Fondo de inversión colectiva abierto sin pacto de permanencia",
    folder: "portfolio",
    img: "fiduoccidente",
    rent: [
      Rent(
        nameRent: "Renta Fija"
      ),
      Rent(
        nameRent: "Renta Variable: FIC"
      )
    ]
  ),
  SliderPortfolio(
    name: "Fondo Balanceado Internacional",
    description: "Ofrece una alternativa de inversión balanceada con exposición de mercados internacionales.",
    type: "Fondo de inversión colectiva abierto con pacto de permanencia",
    folder: "portfolio",
    img: "fiduoccidente",
    rent: [
      Rent(
        nameRent: "Renta Fija"
      ),
      Rent(
        nameRent: "Renta Variable: FIC"
      )
    ]
  )
];