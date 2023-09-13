import 'package:xyz/utils/Utils.dart';

class User {
  int id;
  String name;
  String phone;
  String email;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnPhone: phone,
      columnEmail: email,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  User();

  User.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    phone = map[columnPhone];
    email = map[columnEmail];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Sleep {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Sleep();

  Sleep.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Study {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Study();

  Study.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Eating {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Eating();

  Eating.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Motivation {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Motivation();

  Motivation.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Dance {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Dance();

  Dance.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Exercise {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Exercise();

  Exercise.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Hygiene {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Hygiene();

  Hygiene.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Language {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Language();

  Language.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Health {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Health();

  Health.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Relax {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Relax();

  Relax.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Money {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Money();

  Money.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Priority {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Priority();

  Priority.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Music {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Music();

  Music.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Dressing {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Dressing();

  Dressing.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}

class Equipment {
  int id;
  String name;
  String category;
  String description;
  String date;
  String comment;
  String rating;
  String done;
  String review;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnCategory: category,
      columnDescription: description,
      columnDate: date,
      columnComment: comment,
      columnRating: rating,
      columnDone: done,
      columnReview: review,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Equipment();

  Equipment.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    category = map[columnCategory];
    description = map[columnDescription];
    date = map[columnDate];
    comment = map[columnComment];
    rating = map[columnRating];
    done = map[columnDone];
    review = map[columnReview];
  }
}
