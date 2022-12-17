import 'package:flutter/material.dart';
import 'package:github_client/home_page.dart';
import 'package:github_client/screen/doktor/doktor.dart';
import 'package:github_client/screen/doktor/doktor_bilgileri.dart';
import 'package:github_client/screen/doktor/doktor_duzenle.dart';
import 'package:github_client/screen/doktor/doktor_ekle.dart';
import 'package:github_client/screen/hasta/hasta_bilgi.dart';
import 'package:github_client/screen/hasta/hasta_kayit.dart';
import 'package:github_client/screen/hasta/hasta_liste.dart';
import 'package:github_client/screen/hasta/hasta_randevu_liste.dart';
import 'package:github_client/screen/hastalik/hastalik.dart';
import 'package:github_client/screen/hastalik/hastalik_duzenle.dart';
import 'package:github_client/screen/hastalik/hastalik_ekle.dart';
import 'package:github_client/screen/hastalik/hastalik_liste.dart';
import 'package:github_client/screen/randevu/randeuv_kayit.dart';
import 'package:github_client/screen/randevu/randevu_duzenle.dart';
import 'package:github_client/screen/randevu/randevu_liste.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/doktor':
        return MaterialPageRoute(
          builder: (_) => const Doktor(),
        );
      case '/doktorBilgileri':
        return MaterialPageRoute(
          builder: (_) => const DoktorBilgileri(),
        );
      case '/doktorDuzenle':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => DoktorDuzenle(tckn: args),
          );
        }
        return _errorRoute();
      case '/doktorEkle':
        return MaterialPageRoute(
          builder: (_) => const DoktorEkle(),
        );
      case '/hastalik':
        return MaterialPageRoute(
          builder: (_) => const Hastalik(),
        );
      case '/hastalikBilgileri':
        return MaterialPageRoute(
          builder: (_) => const HastalikListe(),
        );
      case '/hastalikEkle':
        return MaterialPageRoute(
          builder: (_) => const HastalikEkle(),
        );
      case '/hastalikDuzenle':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => HastalikDuzenle(tedavi: args),
          );
        }
        return _errorRoute();
      case '/hastaKayit':
        return MaterialPageRoute(
          builder: (_) => const HastaKayit(),
        );
      case '/hastaListe':
        return MaterialPageRoute(
          builder: (_) => const HastaListe(),
        );
      case '/hastaRandevuListe':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => HastaRandevuListe(tckn: args),
          );
        }
        return _errorRoute();
      case '/hastaBilgi':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => HastaBilgi(tckn: args),
          );
        }
        return _errorRoute();
      case '/randevuKayit':
        return MaterialPageRoute(
          builder: (_) => const RandevuEkle(),
        );
      case '/randevuListe':
        return MaterialPageRoute(
          builder: (_) => const RandevuListe(),
        );
      case '/randevuDuzenle':
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => RandevuDuzenle(id: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: const Text(
            "Üzgünüz aradığınız sayfa bulunamadı",
            style: TextStyle(
              color: Colors.blueAccent,
              fontFamily: 'SourceSansPro',
              fontSize: 18.0,
            ),
          ),
        );
      },
    );
  }
}
