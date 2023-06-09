final aylar = ['','Oca','Şub','Mar','Nis','May','Haz','Tem','Ağu','Eyl','Eki','Kas','Ara'];
final aylar_uzun = ['','Ocak','Şubat','Mart','Nisan','Mayıs','Haziran','Temmuz','Ağustos','Eylül','Ekim','Kasım','Aralık'];
String toDateTimeFormat_ProcessTime(DateTime tarih){
  if (tarih == null) return "";

  var fark = (DateTime.now().difference(tarih));
  var dk = tarih.minute.toString().padLeft(2,'0');
  var sa = tarih.hour.toString().padLeft(2,'0');
  if (fark.inDays > 1)
    return "${tarih.day} ${aylar[tarih.month]} ${tarih.year}";
  //return "${tarih.day} ${aylar[tarih.month]} $sa:$dk";
  else if (fark.inDays == 1)
    return "dün ";
  //return "dün $sa:$dk";
  else if (fark.inHours > 2)
    return "bugün ";
 // return "bugün $sa:$dk";
  else if (fark.inHours >= 1)
    return "${fark.inHours}sa önce";
  else if (fark.inMinutes > 5)
    return "${fark.inMinutes}dk önce";
  else
    return "az önce";
}
