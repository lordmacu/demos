import 'dart:convert';

GetProfileQuestionsModel getProfileQuestionsModelFromJson(String str) => GetProfileQuestionsModel.fromJson(json.decode(str));

String getProfileQuestionsModelToJson(GetProfileQuestionsModel data) => json.encode(data.toJson());

class GetProfileQuestionsModel {
    GetProfileQuestionsModel({
        this.result,
        this.message,
        this.data,
    });

    bool result;
    dynamic message;
    Data data;

    factory GetProfileQuestionsModel.fromJson(Map<String, dynamic> json) => GetProfileQuestionsModel(
        result: json["Result"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "Result": result,
        "Message": message,
        "Data": data.toJson(),
    };
}

class Data {
    Data({
        this.content,
        this.response,
        this.message,
        this.isValid,
        this.httpStatusCode,
        this.result,
    });

    List<Content> content;
    dynamic response;
    dynamic message;
    bool isValid;
    int httpStatusCode;
    dynamic result;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: List<Content>.from(json["Content"].map((x) => Content.fromJson(x))),
        response: json["Response"],
        message: json["Message"],
        isValid: json["IsValid"],
        httpStatusCode: json["HttpStatusCode"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "Content": List<dynamic>.from(content.map((x) => x.toJson())),
        "Response": response,
        "Message": message,
        "IsValid": isValid,
        "HttpStatusCode": httpStatusCode,
        "result": result,
    };
}

class Content {
    Content({
        this.id,
        this.scoreType,
        this.responseScopeType,
        this.valueScope,
        this.valueType,
        this.order,
        this.valueTypeText,
        this.questionCaptions,
        this.questionCaptionsCount,
    });

    String id;
    int scoreType;
    int responseScopeType;
    int valueScope;
    int valueType;
    int order;
    String valueTypeText;
    List<QuestionCaption> questionCaptions;
    int questionCaptionsCount;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["_id"],
        scoreType: json["ScoreType"],
        responseScopeType: json["ResponseScopeType"],
        valueScope: json["ValueScope"],
        valueType: json["ValueType"],
        order: json["Order"],
        valueTypeText: json["ValueTypeText"],
        questionCaptions: List<QuestionCaption>.from(json["QuestionCaptions"].map((x) => QuestionCaption.fromJson(x))),
        questionCaptionsCount: json["QuestionCaptionsCount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "ScoreType": scoreType,
        "ResponseScopeType": responseScopeType,
        "ValueScope": valueScope,
        "ValueType": valueType,
        "Order": order,
        "ValueTypeText": valueTypeText,
        "QuestionCaptions": List<dynamic>.from(questionCaptions.map((x) => x.toJson())),
        "QuestionCaptionsCount": questionCaptionsCount,
    };
}

class QuestionCaption {
    QuestionCaption({
        this.caption,
        this.order,
        this.responses,
        this.possibleResponses,
        this.validationsRules,
    });

    String caption;
    int order;
    List<Response> responses;
    List<Response> possibleResponses;
    dynamic validationsRules;

    factory QuestionCaption.fromJson(Map<String, dynamic> json) => QuestionCaption(
        caption: json["Caption"],
        order: json["Order"],
        responses: List<Response>.from(json["Responses"].map((x) => Response.fromJson(x))),
        possibleResponses: List<Response>.from(json["PossibleResponses"].map((x) => Response.fromJson(x))),
        validationsRules: json["ValidationsRules"],
    );

    Map<String, dynamic> toJson() => {
        "Caption": caption,
        "Order": order,
        "Responses": List<dynamic>.from(responses.map((x) => x.toJson())),
        "PossibleResponses": List<dynamic>.from(possibleResponses.map((x) => x.toJson())),
        "ValidationsRules": validationsRules,
    };
}

class Response {
    Response({
        this.number,
        this.value,
        this.emojiValue,
        this.score,
        this.scoreType,
        this.valueType,
        this.weightedValue,
    });

    int number;
    String value;
    String emojiValue;
    double score;
    int scoreType;
    int valueType;
    double weightedValue;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        number: json["Number"],
        value: json["Value"],
        emojiValue: json["EmojiValue"],
        score: json["Score"],
        scoreType: json["ScoreType"],
        valueType: json["ValueType"],
        weightedValue: json["WeightedValue"],
    );

    Map<String, dynamic> toJson() => {
        "Number": number,
        "Value": value,
        "EmojiValue": emojiValue,
        "Score": score,
        "ScoreType": scoreType,
        "ValueType": valueType,
        "WeightedValue": weightedValue,
    };
}
