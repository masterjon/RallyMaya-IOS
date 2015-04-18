//
//  CampecheViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/25/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "CampecheViewController.h"

@interface CampecheViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>

@end

@implementation CampecheViewController

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
                      @"name":@"Emergencias",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"060"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Denuncia segura",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"066"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Denuncia anónima",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"089"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policia Estatal",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981) 8119110"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Policia Federal Prev.",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)8163635"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"PGR",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981) 8126778"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"ISSSTE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981) 8114116"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"Bomberos",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981) 8164978"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"IMSS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981) 8163802",@"(981) 81112420"],
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
                      @"name":@"LLANTAS ROYAL DEL CARMEN S.A. DE C.V.",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 938 382 3122"],
                      @"address":@"31 267 PETROLERA, 24180 CARMEN, CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTA SIS DEL SURESTE S.D.R.L DE C.V.",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 938 381 8285"],
                      @"address":@"55 421 OBRERA, 24117 CARMEN, CAMPECHE, MEXICO"
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
                      @"name":@"SERVIMAX",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 938 384 4874"],
                      @"address":@"AVENIDA PERIFÉRICA LUIS DONALDO COLOSIO SN SALITRAL, 24189 CARMEN, CAMPECHE, MEXICO"
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
                      @"name":@"SERVILLANTAS DE CHAMPOTON",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 982 828 0732"],
                      @"address":@"EUGENIO ECHEVERRÍA CASTELLOT SN CENTRO, 24400 CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"GENERAL TIRE DE CAMPECHE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 982 828 0732"],
                      @"address":@"EUGENIO ECHEVERRÍA CASTELLOT SN CENTRO, 24400 CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTA MAYA DE CAMPECHE, S.A. DE C.V.",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 981 811 5329"],
                      @"address":@"AVENIDA MAESTROS CAMPECHANOS 363 MULTUNCHAC, 24090 CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"LLANTAS DE CAMPECHE S.A. DE C.V",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 981 811 3283"],
                      @"address":@"LÓPEZ MATEOS 125 SAN ROMAN, 24040 CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"RADIAL LLANTAS",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 981 816 3508"],
                      @"address":@"CIRCUITO BALUARTES 5 SAN ROMAN, 24040 CAMPECHE, MEXICO"
                      },
                  @{
                      @"location":@"",
                      @"name":@"AVANTE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"01 981 811 7133"],
                      @"address":@"AVENIDA CENTRAL 144 A SAN JOSÉ, 24040 CAMPECHE, MEXICO"
                      },
                  
                  ]
          },
      @{
          @"section":@"Refaccionarias",
          @"content":
              @[
                  @{
                      @"location":@"",
                      @"name":@"LEYMAR",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)816-6868"],
                      @"address":@"AV. LOPEZ MATEOS 282, SAN ROMAN, CAMPECHE, C.P. 24040, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA DIESEL EL INGENIERO SA DE CV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)813-1244"],
                      @"address":@"PATRICIO TRUEBA 257D, SAN RAFAEL, CAMPECHE, C.P. 24090, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"CLUBASUR",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(938)382-0062"],
                      @"address":@"AV. PERIFERICO 60, BENITO JUAREZ, CARMEN, C.P. 24180, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA SANTA LUCIA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)815-5695"],
                      @"address":@"AV. ALVARO OBREGON Nº 325, SANTA LUCIA, CAMPECHE, C.P. 24010, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"CENTRO REFACCIONARIO DE CAMPECHE S.A. DE C.V.",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)811-1559"],
                      @"address":@"AV. GOBERNADORES 376, BELEN II, CAMPECHE, C.P. 24050, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA MEXICO",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(938)111-0254"],
                      @"address":@"10 DE JULIO 231, BENITO JUAREZ, CARMEN, C.P. 24180, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA LASTRA SA DE CV",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(938)111-0254"],
                      @"address":@"AV. SOLIDARIDAD MZA 331 L. 86, UNIDAD ESFUERZO Y TRABAJO II, ESCARCEGA, C.P. 24350, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"MADISA",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(938)382-1332"],
                      @"address":@"47 3, PALLAS, CARMEN, C.P. 24140, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"EL CHOQUE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)816-3002"],
                      @"address":@"AV GOBERNADORES N 298, SANTA LUCIA, CAMPECHE, C.P. 24020, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"NISSAN CAMPECHE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)812-5351"],
                      @"address":@"AV LOPEZ MATEOS SN, PRADO, CAMPECHE, C.P. 24030, CAMP."
                      },
                  @{
                      @"location":@"",
                      @"name":@"NISSAN CD DEL CARMEN",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(938)382-0950"],
                      @"address":@"AV. LOPEZ MATEOS 175, PUERTO PESQUERO, CIUDAD DEL CARMEN, C.P. 24129, CAMP"
                      },
                  @{
                      @"location":@"",
                      @"name":@"REFACCIONARIA GOLDEN TRACK SERVICE",
                      @"date":@"",
                      @"emails":@[],
                      @"phones":@[@"(981)811-4741"],
                      @"address":@"AV. GOBERNADORES 234, SANTA LUCIA, CAMPECHE, C.P. 24020, CAMP"
                      },
                  
                  ]
          },
      @{
          @"section":@"Hoteles",
          @"content":
              @[
                  @{
                      @"location":@"Campeche",
                      @"name":@"Plaza Campeche",
                      @"date":@"04 al 05 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"981 811 9900"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Calle 10 # 126 Esq. Circuito Baluartes Col. Centro. C.P 24000, San francisco de Campeche, Campeche"
                      },
                  @{
                      @"location":@"Campeche",
                      @"name":@"Plaza Colonial",
                      @"date":@"04 al 05 de Mayo",
                      @"emails":@[],
                      @"phones":@[@"981 811 9900"],
                      @"desayuno":@"Desayuno: Si",
                      @"address":@"Calle 10 x 51, Centro Histórico, 24000 San Francisco de Campeche, Campeche"
                      },
//                  @{
//                      @"location":@"Campeche",
//                      @"name":@"Ocean View",
//                      @"date":@"04 al 05 de Mayo",
//                      @"emails":@[@"reservaciones@oceanview.com.mx"],
//                      @"phones":@[@"01 981 811 9991"],
//                      @"desayuno":@"",
//                      @"address":@"Pedro Sainz de Baranda o Av. Costera S/N, San Francisco de Campeche, 24010 Campeche, CAMP"
//                      },
//                  @{
//                      @"location":@"Campeche",
//                      @"name":@"Hotel Best Wester del Mar",
//                      @"date":@"04 al 05 de Mayo",
//                      @"emails":@[@"info@delmarhotel.com.mx"],
//                      @"phones":@[@"01 981 811 9191"],
//                      @"desayuno":@"",
//                      @"address":@"Av. Ruiz Cortines #51, Centro, 24000 Campeche, Campeche"
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
                      @"name":@"CMDT. JOSE CORAL MALDONADO",
                      @"date":@"DIRECTOR DE OPERACIONES Y VIALIDADES DE YUCATAN",
                      @"emails":@[],
                      @"phones":@[@"999 351 4024"],
                      @"address":@""
                      },
                  @{
                      @"location":@"",
                      @"name":@"CMDT. JUAN CARLOS GUDENO HERRERA",
                      @"date":@"VIALIDADES MUNICIPALES YUCATAN",
                      @"emails":@[],
                      @"phones":@[@"999 177 4063"],
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
    [self setHeaderColor:[UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]]; //general background color for all of the sections
    // set if one section should always be open. if set to YES, the VC will load with the first section already open, and the open section will not close unless you click a different section
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

