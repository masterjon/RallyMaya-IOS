//
//  PreguntasViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/29/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "PreguntasViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"
@interface PreguntasViewController () <KMAccordionTableViewControllerDataSource,KMAccordionTableViewControllerDelegate>

@end

@implementation PreguntasViewController

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
    self.navigationItem.titleView = [Utils getNavLabel:@"PREGUNTAS FRECUENTES"];

    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    self.items = [[NSMutableArray alloc] init];
    NSArray *directoryItems=
    @[
      

      @{
          @"section":@"Vivo en el extranjero, ¿A quién puedo contactar para participar?",
          @"content":
              @[
                  @{
                      @"respuesta":@"Puedes comunicarte a nuestras oficinas marcando desde tu país y un asesor con gusto te atenderá.\nEstados Unidos: 1855-2068777 \nEspaña: 900-965234 \nItalia: 0800-913638 \nBélgica: 0800-76721 \nReino Unido: 0808-2342845 \nVenezuela: 0800-1627385 \nColombia: 01800-7522374 \nBrasil: 0800-8923372 \nCanadá: 1855-3155526 \nMéxico: +52998-8923170",
                      },
                  
                  ]
          },
      @{
          @"section":@"Vivo en el extranjero, ¿Cómo puedo transportar mi auto o puedo alquilar uno en México?",
          @"content":
              @[
                  @{
                      @"respuesta":@"Puedes contactar a Nafta Group involucrado en la importación temporal de los automóviles y equipamiento de los participantes en el RALLY MAYA MEXICO. \nContacto: Luis Silva y Gutiérrez \nTel: +52 55 5663 0019 \nTel: +52 55 5663 0084 \nE-mail: luis.silva@naftagroup.com \nTambién puedes alquilar un auto. Informes en pr@rallymayamexico.com",
                      },
                  
                  
                  ]
          },
      @{
          @"section":@"¿Necesito documentación especial para participar?",
          @"content":@[
                  @{
                      @"respuesta":@"\n - Deberás llenar el formulario de inscripción en rallymayamexico.com o solicitarlo al correo pr@rallymayamexico.com \n - Enviar fotografías de los participantes tamaño infantil (escaneada)\n - Licencia de automovilista vigente \n - Tarjeta de circulación del vehículo \n - Y enviar fotografías del vehículo participante (mínimo 6)",
                      },
            ]
       },
      @{
          @"section":@"¿Necesito licencia deportiva? Si es así ¿Dónde la tramito?",
          @"content":@[
                  @{
                      @"respuesta":@"No necesitas licencia deportiva, solo licencia de automovilista vigente.",
                      },
            ]
      },
      @{
          @"section":@"En caso de alguna falla del auto o accidente, ¿La organización me respalda?",
          @"content":@[
                  @{
                      @"respuesta":@"Si efectivamente. La organización cuenta con unidades de apoyo que brinda servicios de orientación, asistencia y auxilio turístico durante todo el recorrido, así como ambulancias en caso de accidente.",
                      },
          ]
        },
      @{
          @"section":@"¿Cómo se corre un Tour de Regularidad?",
          @"content":@[
                  @{
                      @"respuesta":@"Es una competición NO DE VELOCIDAD. Se llama prueba de regularidad aquella que consiste en recorrer una distancia a una velocidad media. Existen varias modalidades y variantes, pero a la que nos vamos a referir es a la de MEDIA CONSTANTE EN CARRETERA ABIERTA, también llamada REGULARIDAD CLÁSICA. Una misma prueba suele tener varios tramos de regularidad o cronometrados en los que hay que intentar cumplir esa media, estando comunicados unos con otros, por los llamados tramos de enlace en los que no hay cronometraje, pero puede haber controles horarios o controles de paso.",
                      },
          ]
        },
      @{
          @"section":@"¿Se puede realizar el pago con tarjeta de crédito?",
          @"content":@[
                  @{
                      @"respuesta":@"Si, a través de PayPal directamente en nuestro sitio oficial rallymayamexico.com",
                      },
            ]
        },
      @{
          @"section":@"¿Puede ir otro acompañante en el auto que usemos para competir?",
          @"content":@[@{
                           @"respuesta":@"Únicamente podrán ir a bordo del vehículo dos integrantes (piloto y copiloto).",
                           },
                       ]
        },
      @{
          @"section":@"¿Se podrá expedir factura?",
          @"content":@[@{
                           @"respuesta":@"Sí, en caso de requerir factura deberá solicitarla durante el pago de su inscripción y enviar todos sus datos fiscales al correo informacion@rallymayamexico.com",
                           },
                       ]
       },
      
      ];
    
    for (NSArray *dataDictionary in directoryItems){
        [self.items addObject:dataDictionary];
        
    }
    self.dataSource = self;
    self.delegate = self;
    
    self.rowColor = [UIColor whiteColor];  /*#3ba2b7*/
    self.sections = [self getSectionArray];
    [self setupAppearence];
    // Do any additional setup after loading the view.
}
- (void)setupAppearence {
    [self setHeaderHeight:60];
    [self setHeaderArrowImageClosed:[UIImage imageNamed:@"flecha-arriba"]];
    [self setHeaderArrowImageOpened:[UIImage imageNamed:@"flecha-abajo"]];
    [self setHeaderFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
    [self setHeaderTitleColor:[UIColor blackColor]];
    [self setHeaderSeparatorColor:[UIColor colorWithRed:0.914 green:0.906 blue:0.906 alpha:1] /*#e9e7e7*/];
    [self setHeaderColor:[UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]]; //general background color for all of the sections
    // set if one section should always be open. if set to YES, the VC will load with the first section already open, and the open section will not close unless you click a different section
}
- (NSArray *)getSectionArray {
    
    NSMutableArray *listArray = [[NSMutableArray alloc] init];
    int ident = 15;
    for (NSDictionary *section in self.items ){
        
        UIView *viewOfSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-40, 0)];
        int i = 0;
        int textHeight = 5;
        for (NSDictionary *myitems in section[@"content"]){
            
            if ([myitems[@"respuesta"] length] != 0) {
                UILabel *cRespuesta = [[UILabel alloc] init];
                [cRespuesta setText:myitems[@"respuesta"]];
                cRespuesta.lineBreakMode = NSLineBreakByWordWrapping;
                cRespuesta.numberOfLines = 0;
                
                [cRespuesta setFont:[UIFont fontWithName:@"TrebuchetMS" size:12]];
                [cRespuesta setTextColor:[UIColor colorWithRed:0.545 green:0.545 blue:0.545 alpha:1] /*#8b8b8b*/];
                //[cRespuesta.layer setBorderColor: [[UIColor redColor] CGColor]];
                //[cRespuesta.layer setBorderWidth: 1.0];
                
                [viewOfSection addSubview:cRespuesta];
                NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
                CGSize labelSize = (CGSize){self.view.frame.size.width, 999};
                CGRect r = [cRespuesta.text boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:context];
                cRespuesta.frame = CGRectMake(ident, i, self.view.frame.size.width-30, r.size.height+textHeight);
                i=i+r.size.height+textHeight;
                //ident = 15;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}
- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
