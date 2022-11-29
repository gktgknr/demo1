// To parse this JSON data, do
//
//     final games = gamesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Games gamesFromJson(String str) => Games.fromJson(json.decode(str));

String gamesToJson(Games data) => json.encode(data.toJson());

class Games {
    Games({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
        required this.seoTitle,
        required this.seoDescription,
        required this.seoKeywords,
        required this.seoH1,
        required this.noindex,
        required this.nofollow,
        required this.description,
        required this.filters,
        required this.nofollowCollections,
    });

    int count;
    String next;
    dynamic previous;
    List<Result> results;
    String seoTitle;
    String seoDescription;
    String seoKeywords;
    String seoH1;
    bool noindex;
    bool nofollow;
    String description;
    Filters filters;
    List<String> nofollowCollections;

    factory Games.fromJson(Map<String, dynamic> json) => Games(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        seoTitle: json["seo_title"],
        seoDescription: json["seo_description"],
        seoKeywords: json["seo_keywords"],
        seoH1: json["seo_h1"],
        noindex: json["noindex"],
        nofollow: json["nofollow"],
        description: json["description"],
        filters: Filters.fromJson(json["filters"]),
        nofollowCollections: List<String>.from(json["nofollow_collections"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "seo_keywords": seoKeywords,
        "seo_h1": seoH1,
        "noindex": noindex,
        "nofollow": nofollow,
        "description": description,
        "filters": filters.toJson(),
        "nofollow_collections": List<dynamic>.from(nofollowCollections.map((x) => x)),
    };
}

class Filters {
    Filters({
        required this.years,
    });

    List<FiltersYear> years;

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        years: List<FiltersYear>.from(json["years"].map((x) => FiltersYear.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
    };
}

class FiltersYear {
    FiltersYear({
        required this.from,
        required this.to,
        required this.filter,
        required this.decade,
        required this.years,
        required this.nofollow,
        required this.count,
    });

    int from;
    int to;
    String filter;
    int decade;
    List<YearYear> years;
    bool nofollow;
    int count;

    factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"],
        to: json["to"],
        filter: json["filter"],
        decade: json["decade"],
        years: List<YearYear>.from(json["years"].map((x) => YearYear.fromJson(x))),
        nofollow: json["nofollow"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "filter": filter,
        "decade": decade,
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
        "nofollow": nofollow,
        "count": count,
    };
}

class YearYear {
    YearYear({
        required this.year,
        required this.count,
        required this.nofollow,
    });

    int year;
    int count;
    bool nofollow;

    factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"],
        count: json["count"],
        nofollow: json["nofollow"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
    };
}

class Result {
    Result({
        required this.id,
        required this.slug,
        required this.name,
        required this.released,
        required this.tba,
        required this.backgroundImage,
        required this.rating,
        required this.ratingTop,
        required this.ratings,
        required this.ratingsCount,
        required this.reviewsTextCount,
        required this.added,
        required this.addedByStatus,
        required this.metacritic,
        required this.playtime,
        required this.suggestionsCount,
        required this.updated,
        required this.userGame,
        required this.reviewsCount,
        required this.saturatedColor,
        required this.dominantColor,
        required this.platforms,
        required this.parentPlatforms,
        required this.genres,
        required this.stores,
        required this.clip,
        required this.tags,
        required this.esrbRating,
        required this.shortScreenshots,
    });

    int id;
    String slug;
    String name;
    DateTime released;
    bool tba;
    String backgroundImage;
    double rating;
    int ratingTop;
    List<Rating> ratings;
    int ratingsCount;
    int reviewsTextCount;
    int added;
    AddedByStatus addedByStatus;
    int metacritic;
    int playtime;
    int suggestionsCount;
    DateTime updated;
    dynamic userGame;
    int reviewsCount;
    String saturatedColor;
    String dominantColor;
    List<PlatformElement> platforms;
    List<ParentPlatform> parentPlatforms;
    List<Genre> genres;
    List<Store> stores;
    dynamic clip;
    List<Genre> tags;
    EsrbRating esrbRating;
    List<ShortScreenshot> shortScreenshots;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"].toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: AddedByStatus.fromJson(json["added_by_status"]),
        metacritic: json["metacritic"],
        playtime: json["playtime"],
        suggestionsCount: json["suggestions_count"],
        updated: DateTime.parse(json["updated"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        platforms: List<PlatformElement>.from(json["platforms"].map((x) => PlatformElement.fromJson(x))),
        parentPlatforms: List<ParentPlatform>.from(json["parent_platforms"].map((x) => ParentPlatform.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        clip: json["clip"],
        tags: List<Genre>.from(json["tags"].map((x) => Genre.fromJson(x))),
        esrbRating: EsrbRating.fromJson(json["esrb_rating"]),
        shortScreenshots: List<ShortScreenshot>.from(json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released": "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus.toJson(),
        "metacritic": metacritic,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "updated": updated.toIso8601String(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "parent_platforms": List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "clip": clip,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "esrb_rating": esrbRating.toJson(),
        "short_screenshots": List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
    };
}

class AddedByStatus {
    AddedByStatus({
        required this.yet,
        required this.owned,
        required this.beaten,
        required this.toplay,
        required this.dropped,
        required this.playing,
    });

    int yet;
    int owned;
    int beaten;
    int toplay;
    int dropped;
    int playing;

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
    );

    Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}

class EsrbRating {
    EsrbRating({
        required this.id,
        required this.name,
        required this.slug,
    });

    int id;
    String name;
    String slug;

    factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Genre {
    Genre({
        required this.id,
        required this.name,
        required this.slug,
        required this.gamesCount,
        required this.imageBackground,
        required this.domain,
        required this.language,
    });

    int id;
    String name;
    String slug;
    int gamesCount;
    String imageBackground;
    String domain;
    String language;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"] == null ? null : json["domain"],
        language: json["language"] == null ? null : json["language"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain == null ? null : domain,
        "language": language == null ? null : language,
    };
}

class ParentPlatform {
    ParentPlatform({
        required this.platform,
    });

    EsrbRating platform;

    factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromJson(json["platform"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
    };
}

class PlatformElement {
    PlatformElement({
        required this.platform,
        this.releasedAt,
        this.requirementsEn,
        this.requirementsRu,
    });

    PlatformPlatform platform;
    DateTime? releasedAt;
    Requirements? requirementsEn;
    Requirements? requirementsRu;

    factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null ? null : Requirements.fromJson(json["requirements_en"]),
        requirementsRu: json["requirements_ru"] == null ? null : Requirements.fromJson(json["requirements_ru"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
        "released_at": releasedAt == null ? null : "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements_en": requirementsEn == null ? null : requirementsEn!.toJson(),
        "requirements_ru": requirementsRu == null ? null : requirementsRu!.toJson(),
    };
}

class PlatformPlatform {
    PlatformPlatform({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.yearEnd,
        required this.yearStart,
        required this.gamesCount,
        required this.imageBackground,
    });

    int id;
    String name;
    String slug;
    dynamic image;
    dynamic yearEnd;
    int yearStart;
    int gamesCount;
    String imageBackground;

    factory PlatformPlatform.fromJson(Map<String, dynamic> json) => PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"] == null ? null : json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart == null ? null : yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}

class Requirements {
    Requirements({
        required this.minimum,
        required this.recommended,
    });

    String minimum;
    String recommended;

    factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"] == null ? null : json["recommended"],
    );

    Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended == null ? null : recommended,
    };
}

class Rating {
    Rating({
        required this.id,
        required this.title,
        required this.count,
        required this.percent,
    });

    int id;
    String title;
    int count;
    double percent;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
    };
}

class ShortScreenshot {
    ShortScreenshot({
        required this.id,
        required this.image,
    });

    int id;
    String image;

    factory ShortScreenshot.fromJson(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}

class Store {
    Store({
        required this.id,
        required this.store,
    });

    int id;
    Genre store;

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: Genre.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "store": store.toJson(),
    };
}
