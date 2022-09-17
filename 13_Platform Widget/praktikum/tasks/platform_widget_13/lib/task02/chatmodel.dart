import 'package:emojis/emojis.dart';
import 'package:intl/intl.dart';

class ChatModel {
  final String name;
  final String message;
  final String time;
  final String profile;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.profile});
}

final List<ChatModel> itemsChat = [
  ChatModel(
      name: "Ayu",
      message: "Nongkrong kaga?",
      time: DateFormat().add_jm().format(DateTime.now()),
      profile: "https://f4.bcbits.com/img/a4227575367_10.jpg"),
  ChatModel(
      name: "Salma",
      message: Emojis.smilingFace,
      time: DateFormat().add_jm().format(DateTime.now()),
      profile:
          "https://uploadstatic-sea.mihoyo.com/strategyweb/20200906/2020090609442633360.jpg"),
  ChatModel(
      name: "Asep",
      message: "Malam ini Nongkrong kaga?",
      time: DateFormat().add_jm().format(DateTime.now()),
      profile:
          "https://cdn-image.hipwee.com/wp-content/uploads/2018/05/hipwee-73346-1.jpg"),
  ChatModel(
      name: "Farhan",
      message: "Lu udahan Tugas Kampus?",
      time: DateFormat().add_jm().format(DateTime.now()),
      profile:
          "https://asset.kompas.com/crops/HD7pJhzjNDH9W00PnHPd4NFXzeo=/0x0:1000x667/750x500/data/photo/2020/01/31/5e33ec75cccda.jpg"),
  ChatModel(
      name: "Pak Reko (Dosen Pembimbing Akademik)",
      message: "Kalu hari jumat tolong keruangan saya ya",
      time: DateFormat().add_jm().format(DateTime.now()),
      profile:
          "https://www.kotajogja.com/wp-content/uploads/2019/08/sinar.jpg"),
  ChatModel(
      name: "Siti",
      message: "Kamu dimana dek, mama nyariin kamu",
      time: DateFormat().add_jm().format(DateTime.now()),
      profile:
          "https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/intisarifoto/original/52155_senja.jpg"),
  ChatModel(
      name: "Ilham",
      message: "Kapan Kapan kita touring yu",
      time: DateFormat().add_jm().format(DateTime.now()),
      profile:
          "https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/intisarifoto/original/52155_senja.jpg"),
  ChatModel(
      name: "Rafi",
      message: "Lu sekarang kerja / kuliah?",
      time: DateFormat().add_jm().format(DateTime.now()),
      profile:
          "https://img.okezone.com/content/2021/02/03/612/2355792/ahli-ungkap-rahasia-di-balik-kenikmatan-menatap-langit-senja-UBO99TGPG2.jpg"),
];
