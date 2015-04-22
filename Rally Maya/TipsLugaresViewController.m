//
//  TipsLugaresViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/24/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "TipsLugaresViewController.h"

@interface TipsLugaresViewController ()<KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>
@property (nonatomic,strong) UIView *viewGeneralSection;

@end

@implementation TipsLugaresViewController
    
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
    //[[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    //[[NSNotificationCenter defaultCenter]
    //addObserver:self selector:@selector(orientationChanged:)
    //name:UIDeviceOrientationDidChangeNotification
    //object:[UIDevice currentDevice]];
    self.items = [[NSMutableArray alloc] init];
    NSArray *directoryItems=
    @[
      
      
      @{
          @"section":@"MÉRIDA",
          @"content":
              @[
                  NSLocalizedString(@"La Ciudad Blanca, envuelta en el Mundo Maya, es una ciudad  colonial que se caracteriza por la hospitalidad generosa de su gente, con sus barrios coloniales, arboladas y señoriales avenidas, con servicios de clase mundial, variada gastronomía, vida nocturna y modernas instalaciones garantiza el éxito de los negocios  y un recuerdo duradero de una experiencia única.",nil),
                  
                  ]
          },
      
      
      @{
          @"section":@"UMAN",
          @"content":
              @[
                  NSLocalizedString(@"Visitar la magnífica Parroquia de San Francisco que antes formo parte de un Convento del siglo XVI de proporciones imponentes, destaca su imponente fachada de cantera que quedó inconclusa.",nil),
                  ]
          },
      
      @{
          @"section":@"MUNA",
          @"content":
              @[ NSLocalizedString(@"Lugar de agua suave o tierna, por derivarse de las voces mun (tierno, suave) y á o há agua. En la época prehispánica perteneció al cacicazgo de Tutul xiu y después de la conquista permaneció bajo el régimen de las encomiendas entre las que se puede mencionar la de Don Alonzo Rosado en 1700.",nil),
                 
                 ]
          },
      @{
          @"section":@"BÉCAL",
          @"content":
              @[ NSLocalizedString(@"El pueblo de Bécal fue fundado en 1450, aproximadamente. Se dice que su nombre proviene de Bé-akal (camino al aguaje o jagüey) o de Bel-cá (camino de pueblo); otra acepción es Bel-há (camino de agua). Encierra una de las tradiciones más fascinantes de esta tierra: la confección de sombreros de una fibra llamada jipi y palma de huano. Los mundialmente famosos panamás.",nil),
                 
                 ]
          },
      
      @{
          @"section":@"CAMPECHE",
          @"content":
              @[
                  NSLocalizedString(@"La mezcla de la actividad comercial del puerto y su afán de protección contra sus agresores de la época dio como resultado la imagen colonial y defensiva del Campeche que hoy puede apreciarse en sus imponentes fuertes y baluartes, sus hermosos templos, plazas y palacios del que fue el puerto de mercancías más estratégico entre la Nueva España y Europa. La ciudad es una rica muestra de lo mejor de la gastronomía del Estado.",nil),
                  
                  ]
          },
      
      
      @{
          @"section":@"HOPELCHEN",
          @"content":
              @[ NSLocalizedString(@"Hopelchén o lugar de los cinco pozos, se sitúa al este del Estado en la frontera con Yucatán, en la región de los Chenes, nombre maya para describir a los pozos, fuente principal de agua en el área. Su cabecera municipal crece en torno a su iglesia de San Antonio  cuyo retablo mayor dedicado a la Virgen María data de la época colonial; y a su plaza, lugar de reunión de los pobladores donde se conjugan de manera cordial la cultura mestiza y la menonita, que hace unos años se estableció en la región.",nil),
                 
                 ]
          },
      @{
          @"section":@"SANTA ROSA XTAMPAK",
          @"content":
              @[ NSLocalizedString(@"En maya “Muros Viejos”, A este sitio se le considera como la ciudad prehispánica más importante de la región de los Chenes, ya que instituyó una capital regional en el área maya; además se le conoce como el sitio de mayor tamaño de aquella región.",nil),
                 
                 ]
          },
      @{
          @"section":@"UXMAL",
          @"content":
              @[ NSLocalizedString(@"Uno de los sitios  arqueológicos  de todo Mesoamericana y declarado Patrimonio de la Humanidad por la Unesco. Las edificaciones más sobresalientes son: el cuadrángulo de las monjas, el Juego de Pelota, el templo de los Monumentos, la casa de las Tortugas, el Palacio del Gobernador, y la casa del Adivino, pirámide de 35 metros de altura, cuenta con el museo de sitio en el cual se exhiben bellas e interesantes piezas de piedra tallada y cerámica.",nil),
                 ]
          },

      @{
          @"section":@"MANÍ",
          @"content":
              @[ NSLocalizedString(@"Lugar del mayor de los cacicazgos mayas. Este lugar fue testigo de uno de los actos más infames en la historia, el “Acto de Fe”, cuando Fray Diego de Landa  en 1561, mandó quemar varios objetos que los mayas valoraban, incluyendo los códices que hablaban de la historia, creencias y astronomía de los mayas.",nil),
                 
                 ]
          },
      @{
          @"section":@"Z. A. MAYAPAN",
          @"content":
              @[ NSLocalizedString(@"Llegó a ser el centro más importante de la civilización maya durante el siglo XIII de nuestra era. Fue construida de forma muy similar a Chichen Itzá. Cuenta con más de 4 mil estructuras rodeadas por una gran muralla y decenas de cenotes. Se destaca el castillo de Kukulkán, en donde  tiene lugar un interesante fenómeno de luz y sombra durante el solsticio de invierno, similar al de Chichen Itzá.",nil),
                 
                 ]
          },
//      @{
//          @"section":@"DZIBILCHALTUN",
//          @"content":
//              @[ NSLocalizedString(@"Su estructura más famosa es la Casa de las siete Muñecas, en los equinoccios de primavera y otoño, la orientación  del edificio hace que el sol pueda verse a través de las puertas  este y oeste, otro ejemplo de la precisión matemática de los mayas, también cuenta con el museo del pueblo maya y un cenote para nadar.",nil),
//                 
//                 ]
//          },

      @{
          @"section":@"Z. A. XCAMBÓ",
          @"content":
              @[ NSLocalizedString(@"'Cocodrilo celestial' o 'Lugar donde se realizan trueques' Espléndido escaparate natural que combina apacibles playas y una zona arqueológica.  Es un yacimiento arqueológico que se encuentra ubicado en el municipio de Dzemul Es considerada por los expertos como una de los yacimientos de mayor extensión en la costa norte peninsular, contando con edificios de grandes dimensiones.",nil),
                 
                 ]
          },
      @{
          @"section":@"DZILAM GONZALEZ",
          @"content":
              @[ NSLocalizedString(@"Significa 'Pelado o descortezado' En la época prehispánica perteneció al cacicazgo de los cheles. Después de realizada la conquista permaneció bajo el régimen de las encomiendas, las que prevalecen durante toda la época colonial. Se caracteriza por su peculiar Fiesta Tradicional.",nil),
                 
                 ]
          },
      @{
          @"section":@"TIZIMIN",
          @"content":
              @[ NSLocalizedString(@"Es traducido como lugar del 'tzimin' (tapir) El sitio que hoy ocupa Tizimín formaba parte, en tiempos prehispánicos, de la provincia de los Cupules. Cuenta con monumentos Arquitectónicos: El ex convento y parroquia de los Santos Reyes (siglos XVII); ex convento y templo de San Francisco (siglo XVI).",nil),
                 
                 ]
          },
      @{
          @"section":@"CHICHEN ITZÁ",
          @"content":
              @[ NSLocalizedString(@"Una de las 7 maravillas del Mundo; se puede admirar el Castillo, el Templo de los Guerreros, el Grupo de las mil Columnas, la Plataforma de Venus, el Tzompantli, el Juego de Pelota, el Caracol, antiguo Observatorio y la Iglesia. Es la más impresionante de las ruinas de la civilización Maya. El edificio más conocido es el Castillo, tiene una altura de poco más de 30 metros y en la parte superior hay un templo dedicado a Kukulkán.",nil),
                 
                 ]
          },
      @{
          @"section":@"VALLADOLID",
          @"content":
              @[ NSLocalizedString(@"Valladolid, donde sucedieron dos grandes pasajes de la historia de México: “La Guerra de Castas” en 1847 y “La Primera chispa de la Revolución Mexicana” en 1910: es conocida actualmente como “La Capital del Oriente Maya”, título merecido no sólo por la belleza arquitectónica de sus edificaciones coloniales ancestrales como el Convento de San Bernardino de Siena, el Palacio Municipal, la Iglesia de San Servacio, el Ex Telar de la Aurora, el Museo de San Roque, así como otros no menos importantes.",nil),
                 
                 ]
          },

//      @{
//          @"section":@"XCARET",
//          @"content":
//              @[ NSLocalizedString(@"'Xcaret' significa en maya pequeña caleta, pues cuenta con una ensenada de extraordinaria belleza. La ubicación geográficamente conveniente de esta caleta la hizo atractiva para los mayas, quienes construyeron ahí un puerto y centro mercantil.",nil)
//                 
//                 ]
//          },
      @{
          @"section":@"PLAYA DEL CARMEN",
          @"content":
              @[ NSLocalizedString(@"Antiguamente un pequeño pueblo, Playa del Carmen es hoy día uno de los sitios más glamurosos del Caribe Mexicano. “Playa”, como lo llaman sus visitantes asiduos, se sitúa en el corazón de la Riviera Maya y congrega los mejores restaurantes, tiendas y centros nocturnos. Playa del Carmen es uno de los destinos culinarios más importantes de la Riviera Maya.",nil),
                 
                 ]
          },
      @{
          @"section":@"CANCÚN",
          @"content":
              @[ NSLocalizedString(@"Cancún forma parte del territorio de la antigua civilización maya y aún es considerado la entrada al Mundo Maya. Cancún se distingue por contar con infraestructura, modernos centros de entretenimiento y filosofía de servicio que rivalizan con destinos vacacionales en todo el mundo. Este destino ofrece a los viajeros lo mejor de muchos mundos: del Caribe y de México; de los tiempos modernos y los antiguos; de la aventura y la tranquilidad.",nil),
                 
                 ]
          },
      @{
          @"section":@"ISLA MUJERES",
          @"content":
              @[ NSLocalizedString(@"Los primeros vestigios en Isla Mujeres datan del año 564 dc. La isla era una posición estratégica para los navegantes mayas los cuales construyeron ya en el período posclásico, un faro al sur de la misma para ayudas a la navegación. ",nil),
                 ]
          },
      ];
    
    
    for (NSArray *dataDictionary in directoryItems){
        [self.items addObject:dataDictionary];
        
    }
    self.dataSource = self;
    self.delegate = self;
    
    self.rowColor = [UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]; /*#3ba2b7*/
    self.sections = [self getSectionArray];
    [self setupAppearence];
    
}

- (void)setupAppearence {
    [self setHeaderHeight:50];
    // [self setHeaderArrowImageClosed:[UIImage imageNamed:@"carat-open"]];
    // [self setHeaderArrowImageOpened:[UIImage imageNamed:@"carat"]];
    [self setHeaderFont:[UIFont  boldSystemFontOfSize:16]];
    [self setHeaderTitleColor:[UIColor whiteColor]];
    [self setHeaderSeparatorColor:[UIColor  colorWithRed:0.855 green:0.694 blue:0.502 alpha:1]];
    [self setHeaderColor:[UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]]; //general background color for all of the sections
    //[self setOneSectionAlwaysOpen:YES];
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
    NSInteger index = 0;
    for (NSDictionary *section in self.items ){
        
        UIView *viewOfSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
        int i = 10;
        int height = 0;
        NSInteger subIndex = 0;
        for (NSString *myitems in section[@"content"]){
            UILabel *cSubsection = [[UILabel alloc] init];
            cSubsection.lineBreakMode = NSLineBreakByWordWrapping;
            cSubsection.numberOfLines = 0;
            [cSubsection setText:myitems];
            
            
                [cSubsection setFont:[UIFont systemFontOfSize:15]];
                
             
            
            [cSubsection setTextColor:[UIColor colorWithRed:0.439 green:0.439 blue:0.439 alpha:1]];
            //[cSubsection.layer setBorderWidth: 1.0];
            [viewOfSection addSubview:cSubsection];
            NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
            CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
            CGRect r = [cSubsection.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]} context:context];
            if (r.size.height >= 20.00){
                cSubsection.frame = CGRectMake(10, i, self.view.frame.size.width-10, r.size.height);
                i=i+r.size.height;
                height=height+r.size.height+15;
            }
            else{
                cSubsection.frame = CGRectMake(10, i, self.view.frame.size.width-10, r.size.height);
                i=i+r.size.height;
                height=height+r.size.height;
                
            }
            // NSLog(@"%f",r.size.height);
            
            // NSLog(@"%i",i);
            subIndex++;
            
            
        }
        
        viewOfSection.frame = CGRectMake(0, 0, self.view.frame.size.width, height);
        KMSection *section3 = [[KMSection alloc] init];
        section3.view = viewOfSection;
        section3.title = [section[@"section"] capitalizedString];
        section3.colorForBackground = self.rowColor;
        [listArray  addObject:section3];
        index++;
        
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