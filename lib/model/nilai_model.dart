class AddNilai {
    Data data;
    Meta meta;

    AddNilai({
        required this.data,
        required this.meta,
    });

}

class Data {
    int id;
    Attributes attributes;

    Data({
        required this.id,
        required this.attributes,
    });

}

class Attributes {
    String namaSiswa;
    int ulanganHarian1;
    int ulanganHarian2;
    int ulanganHarian3;
    int uts;
    int uas;

    Attributes({
        required this.namaSiswa,
        required this.ulanganHarian1,
        required this.ulanganHarian2,
        required this.ulanganHarian3,
        required this.uts,
        required this.uas,
    });

}

class Meta {
    Meta();
}
