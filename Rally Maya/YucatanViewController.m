//
//  YucatanViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/26/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "YucatanViewController.h"

@interface YucatanViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>

@end

@implementation YucatanViewController

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
                      @"name":@"Central de bomberos",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 924-92-42",@"923-29-71"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Bomberos Pacabtun",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 982-72-96"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Bomberos Kukulkán",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 983-05-55"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Bomberos Cd. Industrial",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 919-06-11"],
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
                      @"name":@"Bomberos Col. México",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 927-03-32"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Bomberos Delegación Sur",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 940-11-11"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policía Delegación Sur",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 940-10-14"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Unidad Estatal de Protección Civil",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 800 719 86 33",@"01 999 944 26 88",@"118 (Telcel)"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Comisión Federal de Electricidad",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"071"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Secretaría de Seguridad Pública",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"066",@"01 999 925-25-55"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policía Meridana",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 942-00-60"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Procuraduría del Estado",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 930-32-50",@"066"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Servicio Médico Forense",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 930-32-50 Nº ext. 41008"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Protección Civil Mérida",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 924-87-69 Nº ext. 109",@"111",@"01 999 923 53 36 Nº ext 109",@"01 999 928 83 11"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Cruz Roja - Enmergencias",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 924 98 13",@"01 999 928 53 91",@"065"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Cruz Roja - Ambulancias",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"065",@"01 999 983-02-43"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Clínica IMSS T1 - Conmutador",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 922-56-56"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Clínica IMSS T1 - Urgencias",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 942-01-11"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Clínica IMSS T1 - Ambulancias",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 942-01-14"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Clínica IMSS T1 - Admisión al hospital",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 999 942-01-12"],
                      @"address":@""
                      },
                  ]
          },
      @{
          @"section":@"Vulcanizadoras",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"TALLER DE REPARACIÓN DE LLANTAS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"19 SN, CENTRO KANASÍN, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA SANTA ISABEL",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"58 SN, FRACCIONAMIENTO SANTA ISABEL KANASÍN, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"DIMO LLANTAS Y ACCESORIOS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 938 382 8374"],
                      @"address":@"26 182 SANTA MARGARITA, 24140 CARMEN, CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"SIN NOMBRE SN, SAN LUIS CHUBURNA MÉRIDA, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTAS Y LLANTAS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 981 816 2945"],
                      @"address":@"CALLE 45 110 SANTA ANA, 24050 CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"TALLER DE REP. DE LLANTAS LA GUADALUPANA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"18 SN, TRES REYES TZUCACAB, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"31 SNUM, CHUBURNA DE HIDALGO MÉRIDA, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA EL FLACO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"23 108, SIN NONBRE IXIL, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"SIN NOMBRE SN, CHUBURNA MÉRIDA, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"TALLER DE YANTAS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"21 SN, TELCHAC, SAN PEDRO TELCHAC PUEBLO, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"10 SN, CUAUHTEMOC KANASÍN, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"25 99, TEPAKAN TEPAKÁN, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"TALLER LLANTERA EN GENERAL",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"11 SN, CENTRO KAUA, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"DISTRIBUIDORA DE LLANTAS BIGOTES",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"AVENIDA SN, SANTA ROSA KANASÍN, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"31 SN, LIBERTAD TAHMEK, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA SOCA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"29 SN, CENTRO PETO, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"SERVICIO DE LLANTERA EL NEGRITO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"21 SN, UCU UCÚ, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"86 EMILIANO ZAPATA SUR 3 MÉRIDA, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"TALLER DE REPARACION DE LLANTAS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"PRIVADA 16 SN, SIN NOMBRE DZILAM DE BRAVO, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA AUTOMOTRIZ MECA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"58 SN, MILCHECHEN 1 KANASÍN, YUCATÁN"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTERA MAURO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@"61 63 SN, SAN PEDRO KANASÍN, YUCATÁN"
                      },
                  
                  ]
          },
      @{
          @"section":@"Refaccionarias",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"REPUESTOS DEL GOLFO Y CARIBE SA DE CV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)923-7142"],
                      @"address":@"CALLE 58 Nº 471, CENTRO, MERIDA, C.P. 97000, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA TMK TRANSMISIONES",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)928-7776"],
                      @"address":@"CALLE 59 A X 84 Y 84 A 556, MERIDA CENTRO, MERIDA, C.P. 97000, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA AUTOMOTRIZ EL ANGEL",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)923-8787"],
                      @"address":@"CALLE 71 521-A, MERIDA CENTRO, MERIDA, C.P. 97000, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LA COLISION",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)923-3824"],
                      @"address":@"AVIACION 520-C, CENTRO, MERIDA, C.P. 97000, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTOPARTES EL HUESO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)983-9684"],
                      @"address":@"C 62 NO 269 X 71 Y 71A, SAN ANTONIO KAUA, MERIDA, C.P. 97176, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA Y TALLER ELECTRICO BUGS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(969)935-3582"],
                      @"address":@"98 150 A, F CANUL REYES, PROGRESO, C.P. 97320, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"GOVI",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)982-3486"],
                      @"address":@"CALLE 25 LOC 2A, CHICHEN-ITZA, MERIDA, C.P. 97170, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"MADISA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)940-0927"],
                      @"address":@"C. 65 N 348 X 38 Y 40, CENTRO, MERIDA, C.P. 97000, YUC"
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
                      @"name":@"REFACCIONARIA AEROPUERTO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)946-3045"],
                      @"address":@"CALLE 12 A S/N, SAN MARCOS NOCOH, MERIDA, C.P. 97296, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"CAR SERVICE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)988-5989"],
                      @"address":@"CALLE 35 DIAG 311 X 32, SAN LUIS CHUBURNA, MERIDA, C.P. 97140, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTORREPUESTOS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)923-1828"],
                      @"address":@"C. 59 X 70 Nº 560, CENTRO, MERIDA, C.P. 97000, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIAS AUTOMOTRICES MA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@""],
                      @"address":@"CALLE 31 186 E, FRANCISCO I MADERO, MERIDA, C.P. 97240, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"DESHUESADERO CAMARIOCA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)289-8082"],
                      @"address":@"A CANCUN LT 10, SAN PEDRO NOH PAT, KANASIN, C.P. 97370, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"DESHUESADERO SAYALLIN",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)945-2633"],
                      @"address":@"PERIFERICO PONIENTE 16568, S/C, MERIDA, C.P. 97300, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"EDIFICIO TOBY AUTO REPUESTOS DE MERIDA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)928-5747"],
                      @"address":@"CALLE 56 Nº 440 X 49, CENTRO, MERIDA, C.P. 97000, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"CAR HOME",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)925-2411"],
                      @"address":@"CIRCUITO COLONIAS C-7 AN 140A X 28 Y 30, GARCIA GINERES, MERIDA, C.P. 97070, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"DESHUESADERO REFACCIONARIA MONTEJO ",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)926-1213"],
                      @"address":@"CALLE 19 Nº 116, ITZIMNA, MERIDA, C.P. 97100, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"CIEN POR CIENTO ACUMULADORES",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)176-5339"],
                      @"address":@"111 595-A, MELITON SALAZAR, MERIDA, C.P. 97269, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"DIST. PENINSULAR AUTOMOTRIZ SA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)926-7792"],
                      @"address":@"60 280, BUENAVISTA, MERIDA, C.P. 97127, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTOPARTES EL VAQUERO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)943-0140"],
                      @"address":@"CARR MERIDA-CHOLUL LOTE 3, LA QUINTA, MERIDA, C.P. 97000, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONES LIZAMA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)982-4539"],
                      @"address":@"CALLE 47 X 14 Y 14A 678, MANUEL AVILA CAMACHO, MERIDA, C.P. 97159, YUC"
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
                      @"name":@"MADERO REFACCIONARIAS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)912-0100"],
                      @"address":@"31 168-E, FRANCISCO I MADERO, MERIDA, C.P. 97240, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"GRUPO VALMEX",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)928-3862"],
                      @"address":@"50 NO. 473, CENTRO, MERIDA, C.P. 97000, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"DESHUESADERO LA CURVA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)943-8444"],
                      @"address":@"AV. CORREA RACHO 425, DIAZ ORDAZ, MERIDA, C.P. 97130, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTOPARTES CORDERO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)188-0956"],
                      @"address":@"CALLE 57 Nº 360 D, CHUMINOPOLIS, MERIDA, C.P. 97158, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"AUTOPARTES USADAS DEL SURESTE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)986-3891"],
                      @"address":@"35 267, SANTA MARIA CHUBURNA, MERIDA, C.P. 97129, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"DESHUESADERO REFACCIONARIA HIDALGO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)212-0235"],
                      @"address":@"35 X 16 Y 16A 271 C, SANTA MARIA CHUBURNA, MERIDA, C.P. 97138, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA EL ELEFANTE SA DE CV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)928-5680"],
                      @"address":@"46 407 X 65, MERIDA CENTRO, MERIDA, C.P. 97000, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"CLUTCH Y FRENOS CHUBURNA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)981-2091"],
                      @"address":@"20 N 137 Y 139, CHUBURNA DE HIDALGO, MERIDA, C.P. 97205, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"NISSAN",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)942-4500"],
                      @"address":@"AV. CIRCUITO COLONIAS S/N, PEDREGALES DE TANLUM, MERIDA, C.P. 97210, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"CAR HOME",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)925-2411"],
                      @"address":@"7-A 140-A, GARCIA GINERES, MERIDA, C.P. 97070, YUC"
                      },
                  @{
                      @"location":@"",
                      @"name":@"GRUPO ROFIL",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)923-0847"],
                      @"address":@"51 479-A, CENTRO, MERIDA, C.P. 97000, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA DIESEL MERIDA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)924-2935"],
                      @"address":@"65-A 519-B, CENTRO, MERIDA, C.P. 97000, YUC."
                      },
                  @{
                      @"location":@"",
                      @"name":@"MACROBODEGA DE CRISTALES Y RADIADORES SA DE CV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(999)986-0461"],
                      @"address":@"35 477, NUEVO YUCATAN, MERIDA, C.P. 97147, YUC."
                      },
                  
                  ]
          },
      @{
          @"section":@"Hoteles",
          @"content":
              @[
                  @{
                      @"location":@"Mérida",
                      @"name":@"Fiesta Americana Mérida",
                      @"date":@"01 al 04 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"01 999 942 1111"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Paseo Montejo No. 451, Esq. Av. Colón Col. Centro, 97000, Mérida, Yucatán, México"
                      },
                  @{
                      @"location":@"Uxmal",
                      @"name":@"The Logde Uxmal Mayaland",
                      @"date":@"05 al 06 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"998 887 2495"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Km. 20 Carret. 180, C.P. 97844 Uxmal, Yucatán"
                      },
                  @{
                      @"location":@"Uxmal",
                      @"name":@"Hacienda Uxmal Mayaland",
                      @"date":@"05 al 06 de Mayo",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Km. 20 Carret. 180, C.P. 97844 Uxmal, Yucatán"
                      },
                  @{
                      @"location":@"Mérida",
                      @"name":@"Fiesta Americana Mérida",
                      @"date":@"06 al 07 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"01 999 942 1111"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Paseo Montejo No. 451, Esq. Av. Colón Col. Centro, 97000, Mérida, Yucatán, México"
                      },
                  @{
                      @"location":@"Chichen Itzá",
                      @"name":@"The Lodge Chichen Itzá",
                      @"date":@"07 al 08 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"998 887 2495"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Carretera Mérida- Cancun, Km 120, C.P. 97751 Chichen-Itzá, Yucatán"
                      },
                  @{
                      @"location":@"Chichen Itzá",
                      @"name":@"Mayaland",
                      @"date":@"07 al 08 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"998 887 2495"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Carretera Mérida- Cancun, Km 120, C.P. 97751 Chichen-Itzá, Yucatán"
                      },
                  @{
                      @"location":@"Chichen Itzá",
                      @"name":@"Oka’an Villas",
                      @"date":@"07 al 08 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"985 858 7857"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Carretera Mérida- Cancun, Km 120, C.P. 97751 Chichen-Itzá, Yucatán"
                      },
                  @{
                      @"location":@"Chichen Itzá",
                      @"name":@"Hacienda Chichen Resort and Yaxkin Spa",
                      @"date":@"07 al 08 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"999 920 8407"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Carretera Mérida- Cancun, Km 120, C.P. 97751 Chichen-Itzá, Yucatán"
                      },
//                  @{
//                      @"location":@"Mérida",
//                      @"name":@"Fiesta Americana Mérida",
//                      @"date":@"",
//                      @"emails":@[@"ventasfamd@posadas.com"],
//                      @"phones":@[@"999 942 1111"],
//                      @"desayuno":@"",
//                      @"address":@"Paseo Montejo No. 451, Esq. Av. Colón Col. Centro, 97000, Mérida, Yucatán, México"
//                      },
//                  @{
//                      @"location":@"Mérida",
//                      @"name":@"Gran Real Mérida",
//                      @"date":@"",
//                      @"emails":@[@"reservaciones@granrealyucatan.com"],
//                      @"phones":@[@"999 928 6081/82/83"],
//                      @"desayuno":@"",
//                      @"address":@"Calle 56 No. 474 Por 55 Centro, C.P. 97000 Mérida, Yucatán, México."
//                      },
//                  @{
//                      @"location":@"Mérida",
//                      @"name":@"Misión Express Mérida Altabrisa",
//                      @"date":@"",
//                      @"emails":@[@"ventasmeridaexpress@hotelesmision.com.mx"],
//                      @"phones":@[@"01 999 942 3600"],
//                      @"desayuno":@"",
//                      @"address":@"Calle 20, Entre calles 15 y 19, 255, Fracc. Altabrisa, 97130 Mérida, Yucatán"
//                      },
//                  @{
//                      @"location":@"Mérida",
//                      @"name":@"Misión Panamericana Mérida",
//                      @"date":@"",
//                      @"emails":@[@"ejecutivomerida3@hotelesmision.com.mx"],
//                      @"phones":@[@"01 999 923 9407"],
//                      @"desayuno":@"",
//                      @"address":@"Calle 59 #455, Centro, C.P. 97000 Mérida, Yucatán"
//                      },
//                  @{
//                      @"location":@"Mérida",
//                      @"name":@"Fiesta Inn Mérida",
//                      @"date":@"",
//                      @"emails":@[@"ventasfimer@posadas.com"],
//                      @"phones":@[@"(999) 964 35 00 "],
//                      @"desayuno":@"",
//                      @"address":@"Calle 5 B No. 290 A x 20 A y 60, Col Revolución. México C.P. 97115, Mérida, Yucatán"
//                      },
//                  @{
//                      @"location":@"Mérida",
//                      @"name":@"Holiday Inn Mérida",
//                      @"date":@"",
//                      @"emails":@[@"reservaciones@hiexmerida.com"],
//                      @"phones":@[@"999 964 2200"],
//                      @"desayuno":@"",
//                      @"address":@"Calle 20A No 300A por 3C y 5ª, Colonia Xcumpich C.P. 97204, Mérida, Yucatán"
//                      },
//                  @{
//                      @"location":@"Mérida",
//                      @"name":@"Hotel los Aluxes",
//                      @"date":@"",
//                      @"emails":@[@"mary-dc-21@hotmail.com"],
//                      @"phones":@[@"01 999 924 2199"],
//                      @"desayuno":@"",
//                      @"address":@"Calle 60 444 X 49 51, Centro, 97000 Mérida, YUC"
//                      },
//                  @{
//                      @"location":@"Uxmal",
//                      @"name":@"The Flycatcher Inn",
//                      @"date":@"",
//                      @"emails":@[@"info@flycatcherinn.com"],
//                      @"phones":@[@"01 997 978 5350"],
//                      @"desayuno":@"",
//                      @"address":@"Calle 20 S/N, San Marcos, 97841 Santa Elena, Yucatán"
//                      },
//                  @{
//                      @"location":@"Chichen Itzá",
//                      @"name":@"Villas Arqueológicas Chichen Itzá",
//                      @"date":@"",
//                      @"emails":@[@"reservas@villasmex.com"],
//                      @"phones":@[@"019858510187"],
//                      @"desayuno":@"",
//                      @"address":@"Km. 120 Carretera Mérida Valladolid Piste Tinúm Chichén Itzá, Yucatán CP 97751"
//                      },
                  
                  
                  ]
          },
      @{
          @"section":@"Gasolineras Full Gas",
          @"content":
              @[
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Chuburná",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"C. 20 #111 x 25 Colonia Chuburná de Hidalgo."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Umán",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Calle 16-A x Calle S/N TAB. CAT. 14177 Municipio de Umán, Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Kopomá",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Carretera Federal Mérida- Campeche km 57 Municipio de Kopomá, Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Muna",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Calle 25 No. 127 Col. San Pastor. C.P. 97840 Municipio de Muna, Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Kanasín",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Tablaje 14431-A localidad y municipio de Kanasín, Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio San Pedro",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Carretera Mérida-Valladolid km 9.5 Kanasín Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Pisté",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Carretera Mérida- Valladolid km 115 Tablaje Catastral 4097. C.P. 97780, Municipio Pisté, Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Ebtún",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Carretera Valladolid-Mérida, tablaje Catastral 9545 C.P. 97780, Municipio Valladolid, Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Zací",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Calle 42 No. 140 Fracc. Campestre del Pedregal, Municipio Valladolid, Yucatán."
                      },
                  @{
                      
                      @"location":@"",
                      @"name":@"Estación de Servicio Chan Yaxché",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[],
                      @"desayuno":@"",
                      @"address":@"Calle 41 Salida Carretera Valladolid-Cancún. Tablaje Catastral 4088, Col. Chan Yaxché. C.P.97780, Valladolid, Yucatán."
                      },
                ]
          },
        @{
          @"section":@"Centro de Convenciones",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"Centro de Convenciones",
                      @"date":@"Lic. Carlos Ariel Franco Osorno",
                      @"emails":@[],
                      @"phones":@[@"(999) 9-42-19-00 ext 106"],
                      @"desayuno":@"",
                      @"address":@"Calle 60Nte. No. 299-E Col Revolución ExCordemex, Mérida, Yucatán. México. CP 97118"
                      },
                  
                  
                  ]
          },
      @{
          @"section":@"Contactos De Comité",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"Benjamin de la Peña Mora",
                      @"date":@"Presidente Fundador",
                      @"emails":@[@"benjamindelapenamora@gmail.com"],
                      @"phones":@[@"998 845 7563"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Cecilia Torres Allier",
                      @"date":@"Coordinador General",
                      @"emails":@[@"pr@rallymayamexico.com",@"direcccion@showtvmedia.com"],
                      @"phones":@[@"998 110 0405"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Wilmer Sotomayor Sanchez",
                      @"date":@"Coordinador General",
                      @"emails":@[@"wilmer3820@hotmail.com"],
                      @"phones":@[@"998 196 3681"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Nayeli Canul Chi",
                      @"date":@"Asistente de Cordinación General",
                      @"emails":@[@"informacion@rallymayamexico.com",@"ventas@showtvmedia.com"],
                      @"phones":@[@"998 115 1148"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Kenneth Betancour Rodriguez",
                      @"date":@"Diseño",
                      @"emails":@[@"design@rallymayamexico.com "],
                      @"phones":@[@"998 135 4961"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Mauricio Maya Oliva",
                      @"date":@"Coordinador Legal",
                      @"emails":@[@"mauriciomaya55@hotmail.com"],
                      @"phones":@[@"998 842 0635"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Rafael Machado ",
                      @"date":@"Responsable del Rally Maya",
                      @"emails":@[@"ramazumx@yahoo.com"],
                      @"phones":@[@"552 563 9317"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Jaime Novelo Montalvo",
                      @"date":@"Coordinador de Cultura Maya",
                      @"emails":@[@"jaimenovelo@prodigy.net.mx"],
                      @"phones":@[@"998 842 0031"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Héctor González Valdepeña",
                      @"date":@"Comisario PF",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Adan Rosario Jimenez Solano",
                      @"date":@"Subinspector PF",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Juan Armin Hernandez Ortiz",
                      @"date":@"Oficial PF",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Eduardo Artigas Coba",
                      @"date":@"Oficial PF",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Miguel Anehl Niri Buen",
                      @"date":@"Suboficial PF",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Juan Alberto Paredes Altamirano",
                      @"date":@"Suboficial PF",
                      @"emails":@[],
                      @"phones":@[],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Rafael Pacheco Coronel",
                      @"date":@"Coordinador de Seguridad",
                      @"emails":@[@"rpcgeneral@hotmail.com"],
                      @"phones":@[@"998 109 9880"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Lorenzo Orozco de la Barquera",
                      @"date":@"Apoyo Logistica",
                      @"emails":@[@"orozcodelabarquera@prodigy.net.mx"],
                      @"phones":@[@"998 109 8128"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Horacio Chousal ",
                      @"date":@"Director de Cronometraje y Control",
                      @"emails":@[@"chousal1953@gmail.com"],
                      @"phones":@[@"722 389 0231"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Rosario Escamilla",
                      @"date":@"Asistente de Cronometraje",
                      @"emails":@[@"rosarioescamilla58@gmail.com"],
                      @"phones":@[@"722 7117072"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Victor Hugo Sánchez Camacho",
                      @"date":@"Director de Prensa",
                      @"emails":@[@"hijodevecino@gmail.com"],
                      @"phones":@[@"553 999 3035"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Luis Berumen García",
                      @"date":@"Apoyo Logistica",
                      @"emails":@[@"lgberumen@yahoo.com.mx"],
                      @"phones":@[@"555 102 0406"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Dennis Rodriguez",
                      @"date":@"Responsable Médico",
                      @"emails":@[],
                      @"phones":@[@"555 437 5972"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Jorge Fuentes Amezcua",
                      @"date":@"Jefe de Vallas",
                      @"emails":@[@"letygro60@gmail.com"],
                      @"phones":@[@"998 577 8727"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Marcos Noe Oliver Mosqueda",
                      @"date":@"Responsable de equipaje",
                      @"emails":@[@"travel-cancun@hotmail.com"],
                      @"phones":@[@"998 841 3559"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Marco Antonio Cureño Herrera",
                      @"date":@"Coordinador Mecanico y Barredora",
                      @"emails":@[@"marcu666@hotmail.com"],
                      @"phones":@[@"998 262 0303"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Edgardo Sierra Larrieu",
                      @"date":@"Responsable de Bienvenida",
                      @"emails":@[@"walloxtreme@hotmail.com"],
                      @"phones":@[],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Juan Jose Ortiz Jasso",
                      @"date":@"Responsable de Acomodo de Autos",
                      @"emails":@[@"fox_juanjo@hotmail.com"],
                      @"phones":@[@"998 844 9803"],
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
    [self setHeaderColor:[UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]]; //general background color for all of the sections
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
                [cDate setFont:[UIFont fontWithName:@"Helvetica" size:14]];
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
