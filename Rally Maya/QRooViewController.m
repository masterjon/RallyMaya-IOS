//
//  QRooViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/26/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "QRooViewController.h"

@interface QRooViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>


@end

@implementation QRooViewController

- (NSInteger)numberOfSectionsInAccordionTableViewController:(KMAccordionTableViewController *)accordionTableView {
    return [self.sections count];
}

- (KMSection *)accordionTableView:(KMAccordionTableViewController *)accordionTableView sectionForRowAtIndex:(NSInteger)index {
    return self.sections[index];
}

- (CGFloat)accordionTableView:(KMAccordionTableViewController *)accordionTableView heightForSectionAtIndex:(NSInteger)index {
    KMSection *section = self.sections[index];
    return section.view.frame.size.height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    int top = 0;
    int left = 0;
    int bottom = 0;
    int right = 0;
    
    [self.myTable setContentInset:UIEdgeInsetsMake(top, left, bottom, right)];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=NSLocalizedString(@"Directorio", nil);
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    self.items = [[NSMutableArray alloc] init];
    NSArray *directoryItems=
    @[
      
      @{
          @"section":@"Número de Emergencias",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"Banco de Sangre",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"887 26 95"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Bomberos",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 12 02"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Cruz Roja Mexicana",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 16 16"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Procuraduría de Defensa al Turista",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"892 48 25"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Bomberos Melitón Salazar",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 984-22-33"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policía Judicial del Estado",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 11 71 / 881 71 50"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policía Federal de Caminos",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 11 07 / 884 15 42"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Unidad Estatal de Protección Civil",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01-800-719-86-33",@"01 999 944 26 88",@" 118 (Telcel)"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Protección Civil ",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"887 34 35"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policía Turística",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"885 22 77"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policía Federal de Caminos",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 11 07",@"884 15 42"],
                      @"address":@""
                      },

                  @{
                      @"location":@"",
                      @"name":@"Incendios Forestales en Estado de Quintana Roo",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 998 206 82 36"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Tel – Sida",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 800 712 08 86"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"CFE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"071"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Jurisdicción Sanitaria",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 23 42"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"TELMEX",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 800 123 22 22"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Seguridad Pública",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 19 13",@"884 23 42",@"884 07 10"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Secretaría de Marina Armada de México *SOS MARINA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"767 627 462"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Cancerología de Quintana Roo ",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"886 67 96",@"843 58 26"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Clínica Victoria",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"884 24 07"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Clínica Morelos",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"886 42 82"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Clínica Médica Taxistas de Cancún A.C.",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"887 74 66"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Hospital Galenia",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"891 52 00",@"891 52 04"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"DIF Municipal",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"888 89 21 y 22"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Hospital General de Cancún",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 998 887 3557"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"UNEME DEDICAM",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"568 04 24"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Quirúrgica del Sur",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"843 54 54"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"IMSS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 800 623 23 23"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"CRIT Quintana Roo",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 99 8193 3000"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Hospital Americano",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 998 287 8023"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"AMERIMED",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"881 34 00"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"HOSPITEN",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"881 37 00"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"ISSSTE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 800 2000 128"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"CRIM ",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"888 56 63",@"888 56 62"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Hospital Regional de Especialidades del IMSS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 998 267 8644"],
                      @"address":@""
                      },
                  ]
          },
      @{
          @"section":@"Hospitales",
          @"content":
              @[
                  @{
                      @"location":@"Cancún",
                      @"name":@"Hospital Galenia",
                      @"date":@"",
                      @"emails":@[@"www.hospitalgalenia.com"],
                      @"phones":@[@"998 891 5200"],
                      @"desayuno":@"",
                      @"address":@"Av. Tulúm, Esq. Nizuc, Mz. 01, Lote 01, Smza. 12, Cancún, Benito Juárez, Quintana Roo, C.P. 77505"
                      },
                  
                  
                  ]
          },
      @{
          @"section":@"Vulcanizadoras",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"LOPEZ AVILES DOUGLAS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(983)832-1814"],
                      @"address":@"CHETUMAL, QUINTANA ROO. CALDERITAS 567 COL. CENTRO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA ELIT",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"044 998 2027580"],
                      @"address":@"CANCUN, QUINTANA ROO. REG. 92 MZ. 39 LT. 20"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA MOVIL CANCUN",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"044 998 2027580"],
                      @"address":@"CANCUN, QUINTANA ROO. REGIÓN 92 MZ. 39 LOTE 20"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA MANDINO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)887-4369"],
                      @"address":@"CANCUN, QUINTANA ROO. AV. KABAH NO. 102 SM. 31 MZ. 6 LT. 20"
                      },
                  @{
                      @"location":@"",
                      @"name":@"RENOVADORA E DE LLANTAS DE Q ROO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(983)832-1998"],
                      @"address":@"CHETUMAL, QUINTANA ROO. AV OBREGON 282 COL. CENTRO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA CALDERON",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-2251"],
                      @"address":@"CANCUN, QUINTANA ROO. S.M. 69 MZ. 5 LOTE 32 AV. FRANCISCO I MADERO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA COZUMEL",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(984)267-2721"],
                      @"address":@"PLAYA DEL CARMEN, QUINTANA ROO. CALLE 74 ENTRE 35 Y 40 COLONIA COLOSIO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA EN PLAYA DEL CARMEN",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(984)134-4704"],
                      @"address":@"PLAYA DEL CARMEN, QUINTANA ROO. CALLE 74 ENTRE 35 Y 40 COLONIA LUIS DONALDO COLOSIO MZ. 382 LOTE 19"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA PALMA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-9919"],
                      @"address":@"CANCUN, QUINTANA ROO. L PORTILLO MZN 60 LT 9 COL. REG 93 CANCUN Q ROO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"VULCANIZADORA PANCHITO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(984)745-7504",@"873-0162"],
                      @"address":@"PLAYA DEL CARMEN, QUINTANA ROO. CALLE 2 NTE. MZ. 89 LT. 6 ENTRE 45 Y CARR. FED."
                      },
                  ]
          },
      @{
          @"section":@"Refaccionarias",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONES LA RIVIERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)843-7334"],
                      @"address":@"JOSE LOPEZ PORTILLO 45 45 8 8, SUPERMANZANA 58, BENITO JUAREZ, C.P. 77515, QR"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LA COLISION",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)887-7236"],
                      @"address":@"AV. JOSE LOPEZ PORTILLO 142 LT 15 LOC A MZA. 45, SUPERMANZANA 63, BENITO JUAREZ, C.P. 77513, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTOPARTES GENKA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)884-5784"],
                      @"address":@"AV LOPEZ PORTILLO LOC 1 MZ-1 1 17 LT-17, SUPERMANZANA 60, BENITO JUAREZ, C.P. 77514, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTOPARTES RV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)891-8173"],
                      @"address":@"AV TALLERES MZ 102 2 Y 3, REGION 91, BENITO JUAREZ, C.P. 77516, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA MARDAM",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-8439"],
                      @"address":@"CALLE 71 NORTE 20 LT. 3, REGION 92, CANCUN, C.P. 77516, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTO ELECTRICA SEGURA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)234-9010"],
                      @"address":@"CO. I MADERO FRANJA 7 MZ. 7, LTE. 56, SUPERMANZANA 68, CANCÚN, C.P. 77524, QR"
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA MARDAM",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-8439"],
                      @"address":@"CALLE 71 NORTE 20 LT. 3, REGION 92, CANCUN, C.P. 77516, QR"
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTO ELECTRICA SEGURA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)234-9010"],
                      @"address":@"FCO. I MADERO FRANJA 7 MZ. 7, LTE. 56, SUPERMANZANA 68, CANCÚN, C.P. 77524, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"TRACTO PARTES Y REFACCIONES DEL SURESTE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(99)9212-3130"],
                      @"address":@"CARR MERIDA-CANCUN KM 1 23 3, SAN PEDRO NOHPAT, KANASIN, C.P. 97370, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA EL SOCIO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-5566"],
                      @"address":@"AV. TALLERES MZA. 50 LTS 3,4 Y 5 LOC 1 Y 2, REGION 90, CANCUN, C.P. 77510, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA DIESEL MORELOS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)898-4211"],
                      @"address":@"FCO. I MADERO MZA. 2 LTE. 11, SUPERMANZANA 72, BENITO JUAREZ, C.P. 77510, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONES CBC",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-3884"],
                      @"address":@"AV JOSÉ LÓPEZ PORTILLO MZ. 61 LOTE 10, SUPERMANZANA 91, BENITO JUAREZ, C.P. 77516, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"DESHUESADERO EL INFIERNO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)898-6012"],
                      @"address":@"LOPEZ PORTILLO 107 LT 4, REGION 99, BENITO JUAREZ, C.P. 77536, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"DESHUESADERO DEL CARIBE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)926-1213"],
                      @"address":@"KM 311.5 FRENTE A COMA, CARR MÉRIDA-CANCÚN, BENITO JUAREZ, C.P. 77500, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"SERVICIOS Y REFACCIONES DE CANCUN SA DE CV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)945-2633"],
                      @"address":@"PASEO CAMPESTRE MZA. 5 LT. 7, SM. 309, BENITO JUAREZ, C.P. 77560, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA EL CAMINANTE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-5605"],
                      @"address":@"CAV FRANCISCO I MADERO MZ.2 LT.34, SM 71, CANCUN, C.P. 77510, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA CAMPOS PARCAMP S",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-8098"],
                      @"address":@"71 MZ 1 LT 1Y2, HACIENDA DEL REY, CANCUN, C.P. 77516, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTORREPUESTOS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)887-1155"],
                      @"address":@"AV LÓPEZ PORTILLO Nº 316, CENTRO, CANCUN, C.P. 77513, QR"
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA EL CAMINANTE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-5605"],
                      @"address":@"AV FRANCISCO I MADERO MZ.2 LT.34, SM 71, CANCUN, C.P. 77510, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"RECONSTRUCTORA DE MOTORES MERIDA, SA DE CV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)888-2718"],
                      @"address":@"33 MZA 4 LT 50, SM 72, BENITO JUAREZ, C.P. 77510, QR."
                      },
                  @{
                      @"location":@"",
                      @"name":@"NISSAN CANCUN",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)848-8930"],
                      @"address":@"BLVD. LUIS DONALDO COLOSIO LOTE 1 MZA. 5, SM 310, BENITO JUAREZ, C.P. 77500, QR"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LUBRICANTES MARAL",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)886-7066"],
                      @"address":@"JOSE LOPEZ PORTILLO S/N, REGION 98, BENITO JUAREZ, C.P. 77537, QR"
                      },
                  @{
                      @"location":@"",
                      @"name":@"DEPCO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)928-7745"],
                      @"address":@"65 297-B X 28 Y 30, CENTRO, MERIDA, C.P. 97000, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA DEL HOGAR",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(998)884-07830"],
                      @"address":@"AV TORCASITA LOCAL 4, MZA. 3 47, SUPERMANZANA 66, CANCUN, C.P. 77510, QR."
                      },
                  ]
          },
      
      @{
          @"section":@"Hoteles",
          @"content":
              @[
                  @{
                      @"location":@"Cancún",
                      @"name":@"Grand Oasis Cancún",
                      @"date":@"08 al 10 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"998 283 3249"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Blvd Kukulkán, Km 16.5, Zona Hotelera, Cancún, Quintana Roo, México C.P. 77500"
                      },
//                  @{
//                      @"location":@"Cancún",
//                      @"name":@"Grand Oasis Cancún",
//                      @"date":@"05 al 06 de Mayo",
//                      @"emails":@[],
//                      @"phones":@[@"01 800 837-8069"],
//                      @"desayuno":@"",
//                      @"address":@"Blvd Kukulkán, Km 16.5, Zona Hotelera, Cancún, Quintana Roo, México C.P. 77500 "
//                      },
                  
                  
                  ]
          },
      @{
          @"section":@"Contactos De Comité",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"BENJAMIN DE LA PEÑA",
                      @"date":@"PRESIDENTE FUNDADOR",
                      @"emails":@[],
                      @"phones":@[@"998 845 7563"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"RAFAEL MACHADO ZUBILLAGA",
                      @"date":@"DIRECTOR GENERAL",
                      @"emails":@[],
                      @"phones":@[@"552 563 9317"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"HORACIO CHOUSAL GARCIA",
                      @"date":@"COORDINADOR TECNICO Y RESULTADOS",
                      @"emails":@[],
                      @"phones":@[@"722 389 0231"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"LIC. MAURICIO MAYA OLIVA",
                      @"date":@"COORDINADOR JURIDICO",
                      @"emails":@[],
                      @"phones":@[@"998 842 0635"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"VICTOR HUGO SANCHEZ ",
                      @"date":@"COORDINADOR DE PRENSA",
                      @"emails":@[],
                      @"phones":@[@"553 999 3035"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"CP. JAIME NOVELO MONTALVO ",
                      @"date":@"COORDINADOR DE CULTURA MAYA",
                      @"emails":@[],
                      @"phones":@[@"998 842 0031"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"GRAL. RAFAEL PACHECO CORONEL",
                      @"date":@"COORDINADOR DE SEGURIDAD Y LOGISTICA",
                      @"emails":@[],
                      @"phones":@[@"998 109 9880"],
                      @"address":@""
                      },

                  @{
                      @"location":@"",
                      @"name":@"CP. LORENZO OROZCO DE LA BARQUERA ",
                      @"date":@"COORDINADOR DEL PARQUE VEHICULAR",
                      @"emails":@[],
                      @"phones":@[@"998 109 8128"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"DR. DENNIS RODRIGUEZ DIAZ",
                      @"date":@"COORDINADOR DE SEVICIOS MEDICOS",
                      @"emails":@[],
                      @"phones":@[@"555 437 5972"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"ARQ. MANUEL OTERO MEDINA",
                      @"date":@"COORDINADOR DE AVANZADAS",
                      @"emails":@[],
                      @"phones":@[@"998 155 1634"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"JUAN MANUEL ESCAREÑO ZAMARON",
                      @"date":@"COORDINADOR DE AVANZADAS",
                      @"emails":@[],
                      @"phones":@[@"818 997 7375"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"EDGARDO SIERRA LARRIEU",
                      @"date":@"COORDINADOR DE BIENVENIDAS",
                      @"emails":@[],
                      @"phones":@[@"238 115 8290"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"JORGE FUENTES AMEZCUA",
                      @"date":@"COORDINADOR DE ARCOS Y VALLAS",
                      @"emails":@[],
                      @"phones":@[@"998 577 8727"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"MARCO ANTONIO OLIVER MOSQUEDA",
                      @"date":@"RESPONSABLE DE TRANSPORTACION",
                      @"emails":@[],
                      @"phones":@[@"998 841 3559"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"MARCO ANTONIO CUREÑO ",
                      @"date":@"COORDINADOR DE SERVICIOS GENERALES",
                      @"emails":@[],
                      @"phones":@[@"998 262 0303"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"GEORGE GOUBERT",
                      @"date":@"RESPONSABLE DE BIENVENIDA EN CANCUN",
                      @"emails":@[],
                      @"phones":@[@"998 735 1171"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"LUIS ARENAS ",
                      @"date":@"RESPONSABLE DE MEDIOS EN CANCUN",
                      @"emails":@[],
                      @"phones":@[@"998 202 5309"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"ING. MARIO TURRENT ANTON",
                      @"date":@"COMITÉ TECNICO",
                      @"emails":@[],
                      @"phones":@[@"462 600 6285"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"ING. MARIO MEDINA RAMIREZ",
                      @"date":@"COMITÉ TECNICO",
                      @"emails":@[],
                      @"phones":@[@"555 398 0028"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"PLACIDO GONZALEZ SALAZAR",
                      @"date":@"COMITÉ TECNICO",
                      @"emails":@[],
                      @"phones":@[@"552 699 4387"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"LUIS ARGUELLLES MARTINEZ",
                      @"date":@"COMITÉ TECNICO",
                      @"emails":@[],
                      @"phones":@[@"222 217 3023 "],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"ING ANTONIO CISERO ANCONA",
                      @"date":@"COMITÉ TECNICO",
                      @"emails":@[],
                      @"phones":@[@"998 213 0984"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"MARCO ANTONIO CUREÑO ",
                      @"date":@"COMITÉ TECNICO",
                      @"emails":@[],
                      @"phones":@[@"998 262 0303"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"CECILIA TORRES ALLIER ",
                      @"date":@"DIRECTORA GENERAL DE SHOWTVMEDIA COMERCIALIZADORA DE RALLY MAYA MEXICO",
                      @"emails":@[],
                      @"phones":@[@"998 110 0405"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"WILMER SOTOMAYOR SANCHEZ",
                      @"date":@"ASISTENTE DE DIRECCION GENERAL SHOWTVMEDIA",
                      @"emails":@[],
                      @"phones":@[@"998 196 3681"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"KENNETH BETANCOURT RODRIGUEZ",
                      @"date":@"DISEÑO SHOWTVMEDIA",
                      @"emails":@[],
                      @"phones":@[@"998 135 4961"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"NAYELI CANUL CHI",
                      @"date":@"VENTAS Y REDES DE SHOWTVMEDIA",
                      @"emails":@[],
                      @"phones":@[@"998 115 1148"],
                      @"address":@""
                      },
                  
                  
                  ]
          },
      
      
      ];
    
    for (NSArray *dataDictionary in directoryItems){
        [self.items addObject:dataDictionary];
        
    }
    self.dataSource = self;
    self.delegate = self;
    
    self.rowColor = [UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1];  /*#3ba2b7*/
    self.sections = [self getSectionArray];
    [self setupAppearence];
    
}

- (void)setupAppearence {
    [self setHeaderHeight:50];
    //[self setHeaderArrowImageClosed:[UIImage imageNamed:@"ctrl-down"]];
    //[self setHeaderArrowImageOpened:[UIImage imageNamed:@"ctrl-up"]];
    [self setHeaderFont:[UIFont  boldSystemFontOfSize:16]];
    [self setHeaderTitleColor:[UIColor whiteColor]];
    [self setHeaderSeparatorColor:[UIColor  colorWithRed:0.855 green:0.694 blue:0.502 alpha:1]];
    [self setHeaderColor:[UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]];//general background color for all of the sections
    [self setOneSectionAlwaysOpen:NO]; // set if one section should always be open. if set to YES, the VC will load with the first section already open, and the open section will not close unless you click a different section
}

- (void)teste {
    KMSection *section = self.sections[2];
    
    UIView *view = section.view;
    view.frame = CGRectMake(0, 0, 320, 400);
    [self reloadOpenedSection];
}

- (NSArray *)getSectionArray {
    
    NSMutableArray *listArray = [[NSMutableArray alloc] init];
    int ident = 10;
    for (NSDictionary *section in self.items ){
        
        UIView *viewOfSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, 0)];
        int i = 0;
        int textHeight = 5;
        for (NSDictionary *myitems in section[@"content"]){
            
            if ([myitems[@"location"] length] != 0) {
                UILabel *cLocation = [[UILabel alloc] init];
                [cLocation setText:[myitems[@"location"] uppercaseString]];
                cLocation.lineBreakMode = NSLineBreakByWordWrapping;
                cLocation.numberOfLines = 0;
                
                [cLocation setFont:[UIFont boldSystemFontOfSize:15]];
                [cLocation setTextColor:[UIColor grayColor]];
                //[cLocation.layer setBorderColor: [[UIColor redColor] CGColor]];
                //[cLocation.layer setBorderWidth: 1.0];
                
                [viewOfSection addSubview:cLocation];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cLocation.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                cLocation.frame = CGRectMake(ident, i, self.view.frame.size.width-10, r.size.height+textHeight);
                i=i+r.size.height+textHeight;
                //ident = 15;
            }
            
            
            if ([myitems[@"name"] length] != 0) {
                UILabel *cName = [[UILabel alloc] init];
                [cName setText:[myitems[@"name"] uppercaseString]];
                cName.lineBreakMode = NSLineBreakByWordWrapping;
                cName.numberOfLines = 0;
                
                [cName setFont:[UIFont boldSystemFontOfSize:15]];
                [cName setTextColor:[UIColor grayColor]];
                //[cName.layer setBorderColor: [[UIColor redColor] CGColor]];
                //[cName.layer setBorderWidth: 1.0];
                
                [viewOfSection addSubview:cName];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cName.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                cName.frame = CGRectMake(ident, i, self.view.frame.size.width-10, r.size.height+textHeight);
                i=i+r.size.height+textHeight;
                
                
            }
            
            if ([myitems[@"date"] length] != 0) {
                UITextView *cDate = [[UITextView alloc] init];
                cDate.editable = NO;
                cDate.scrollEnabled = NO;
                [cDate setText:[myitems[@"date"] uppercaseString]];
                [cDate setFont:[UIFont fontWithName:@"Helvetica" size:12]];
                [cDate setTextColor:[UIColor grayColor]];
                //[cDate.layer setBorderColor: [[UIColor grayColor] CGColor]];
                //[cDate.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cDate.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                cDate.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:cDate];
                i=i+r.size.height+textHeight;
                
                
            }
            if ([myitems[@"desayuno"] length] != 0) {
                UITextView *cDesayuno = [[UITextView alloc] init];
                cDesayuno.editable = NO;
                cDesayuno.scrollEnabled = NO;
                [cDesayuno setText:[myitems[@"desayuno"] uppercaseString]];
                [cDesayuno setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                [cDesayuno setTextColor:[UIColor grayColor]];
                //[cDate.layer setBorderColor: [[UIColor grayColor] CGColor]];
                //[cDate.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cDesayuno.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                cDesayuno.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:cDesayuno];
                i=i+r.size.height+textHeight;
                
                
            }
            for (NSString *email in myitems[@"emails"]){
                UITextView *Email = [[UITextView alloc] init];
                Email.dataDetectorTypes = UIDataDetectorTypeAll;
                Email.editable = NO;
                Email.scrollEnabled = NO;
                [Email setText:email];
                [Email setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                [Email setTextColor:[UIColor grayColor]];
                //[Email.layer setBorderColor: [[UIColor purpleColor] CGColor]];
                //[Email.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [Email.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                Email.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:Email];
                i=i+r.size.height+textHeight;
            }
            
            for (NSString *phone in myitems[@"phones"]){
                UITextView *Phone = [[UITextView alloc] init];
                Phone.dataDetectorTypes = UIDataDetectorTypeAll;
                Phone.editable = NO;
                Phone.scrollEnabled = NO;
                [Phone setText:phone];
                [Phone setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                [Phone setTextColor:[UIColor grayColor]];
                //[Phone.layer setBorderColor: [[UIColor purpleColor] CGColor]];
                //[Phone.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [Phone.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
                Phone.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:Phone];
                i=i+r.size.height+textHeight;
            }
            
            if ([myitems[@"address"] length] != 0) {
                UITextView *cAddress = [[UITextView alloc] init];
                cAddress.editable = NO;
                cAddress.scrollEnabled = NO;
                [cAddress setText:[myitems[@"address"] uppercaseString]];
                [cAddress setFont:[UIFont fontWithName:@"Helvetica" size:14]];
                [cAddress setTextColor:[UIColor grayColor]];
                //[cAddress.layer setBorderColor: [[UIColor grayColor] CGColor]];
                //[cAddress.layer setBorderWidth: 1.0];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cAddress.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]} context:context];
                cAddress.frame =  CGRectMake(ident, i, self.view.frame.size.width-ident, r.size.height+textHeight);
                [viewOfSection addSubview:cAddress];
                i=i+r.size.height+textHeight;
                
                
            }
            
            i=i+15;
            
        }
        // NSLog(@"%i -- %@",i,section[@"section"]);
        viewOfSection.frame = CGRectMake(0, 0, self.view.frame.size.width-40, i );
        KMSection *section3 = [[KMSection alloc] init];
        section3.view = viewOfSection;
        section3.title = [section[@"section"] capitalizedString];
        section3.colorForBackground = self.rowColor;
        [listArray  addObject:section3];
        
    }
    
    
    
    
    return listArray;
}

#pragma mark - KMAccordionTableViewControllerDelegate

- (void)accordionTableViewControllerSectionDidClosed:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)accordionTableViewControllerSectionDidOpened:(KMSection *)section
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end
