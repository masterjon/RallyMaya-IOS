//
//  DiccionarioViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/11/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "DiccionarioViewController.h"
#import "Utils.h"


@interface DiccionarioViewController ()
    
@end

@implementation DiccionarioViewController
{
    NSArray *recipes;
    NSDictionary *animals;
    NSArray *animalSectionTitles;
    NSArray *animalIndexTitles;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [Utils getNavLabel:@"DICCIONARIO MAYA"];
    UIEdgeInsets adjustForTabbarInsets = UIEdgeInsetsMake(0, 0, CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
    self.tableV.contentInset = adjustForTabbarInsets;
    self.tableV.scrollIndicatorInsets = adjustForTabbarInsets;

    self.collectionItems = [[NSMutableArray alloc] init];


    
   animals = @{@"A" : @[@"Agua: Ja’",@"Aire: Lik’", @"Alcalde: Nojchil Kaaj", @"Apetito: Taakil Jaanal", @"Apasionar: Uts Tu Yich", @"Aplauso: Papax K’ab", @"Asiento: K’aanché", @"Ayudar: Aantaj", @"Alegría: Ki’imk Óol", @"Abrazo: Lóoch"],
      @"B" : @[@"Baile: Óok’ot",@"Bañar O Baño: Ichkíil",@"Barriga: Nak",@"Belleza: Ki’ichpanil Jats’utsil",@"Besar: Ts’u’uts’",@"Bigote: Me’ex",@"Bikini: Kul Eex",@"Boca: Chi’",@"Bostezar: Jaayab",@"Bromear: Báaxal"],
      @"C" : @[@"Caballo: Tsíimin",@"Cabello: Tso’otsel Pool",@"Cabeza: Pool",@"Cachete: P’u’uk",@"Café: Káapej",@"Calambre: Lot’",@"Caliente: Chokoj",@"Calor: Ooxol",@"Calvo: K’olis T’ooroch",@"Calzón: Eex",@"Calle: Beel",@"Canción: K’aay",@"Cara: Ich",@"Cena: Ook’in Janal",@"Cenote: Ts’ono’ot",@"Ciudad: Noj Kaaj Nojoch Kaaj",@"Coche Antiguo: Úuchben Kis Bu’ts",@"Comprar: Maan",@"Chiflar: Xuuxub",@"Chile: Ik",@"Chiste: Báaxal T’aan"],
      @"D" : @[@"Dama: Xunáan Ko’olel",@"Desayuno: Uk’ul",@"Despacio: Chaanbéel",@"Despeinar: Xa’axak’ Pool",@"Día: K’iin",@"Diabetes: Ch’ujuk K’i’ik",@"Dormir: Wenel Wenej",@"Dulce: Ch’ujuk"],
      @"E" : @[@"Elote: Bot: Nal",@"Entrevistar: K’áat Chi’",@"Escribir: Ts’íib",@"Este: Lak’in",@"Estómago: Tsuuk",@"Estrella: Eek’"],
      @"F" : @[@"Familia: Ch’i’ibalil Láak’tsilil",@"Fiesta: Cha’an",@"Final: Ts’ook Xuul"],
      @"G" : @[@"Ganado: Wakax",@"Gente: Máako’ob Wíiniko’ob",@"Grupo: Múuch’",@"Ganar: Náajal",@"Gastar: Xuup"],
      @"H" : @[@"Habitación: Naj Otoch Taanaj",@"Hablar: T’aan",@"Hamaca: K’áan",@"Hermano: Láak’",@"Hombre: Xiib",@"Hotel: Naj Tu’ux Ku K’uchul U’ulabo’ob",@"Huésped: U’ulab"],
      @"I" : @[@"Inaugurar: Chúunpajal",@"Inteligencia: Na’at"],
      @"J" : @[@"Jarana: Síit’ Óok’ot",@"Jícara: Luuch",@"Joven: Xi’ipal"],
      @"K" : @[@"Kilómetro: U P’iisil Mil Meetroso’ob"],
      @"L" : @[@"Lengua: Aak’",@"Líder: Jalachil",@"Luna: Uj",@"Luz: Sáas Sáasil",@"Llave: Ch’otob",@"Lluvia: Cháak",@"Llevar: Biis",@"Llenar: Chuup"],
      @"M" : @[@"Maíz: Ixi’im",@"Mamá: Na’",@"Mar: K’áak’náab",@"Médico: Ts’ak Máak Ts’ak Yaj",@"Meta: Xuul",@"Mosquito: K’oxol Box K’oxol",@"Mujer: Ch’up Ko’olel",@"Música: Paax"],
      @"N" : @[@"Nadar: Báab",@"Nombre: K’aaba’",@"Norte: Xaman",@"Número: Xook"],
      @"O" : @[@"Obedecer: U’uy T’aan",@"Oeste: Chik’in",@"Oir: U’uy",@"Ojo: Ich",@"Ombligo: Tuuch",@"Orden: Tsool",@"Oriente: Lak’in"],
      @"P" : @[@"Padre: Yuum Taat Taatáa",@"Pasear: Ximbal Máan",@"Perro: Peek’",@"Playa: Jáal Ja’",@"Población: Kaaj Kajtalil",@"Poniente: Chik’in",@"Precio: Tojol"],
      @"Q" : @[@"¿Qué?: Ba’ax"],
      @"R" : @[@"Ruta: Bej Beel Bejil"],
      @"S" : @[@"Sed: Uk’aj",@"Sentar: Kutal",@"Señor: Yuum Taat Nojoch Máak",@"Señorita: Ch’úupal",@"Sí: Beey Beyo’",@"Sol: K’iin",@"Sombrero: P’óok",@"Sonrisa: Sak Che’ej",@"Sur: Nojol"],
      @"T" : @[@"Tabaco: K’úuts",@"Tarde: Chúunk’in",@"Tortilla: Waaj",@"Trabajar: Meyaj",@"Tramo: Xóot’"],
      @"V" : @[@"Veloz: Séeb Péekla’an Séeba’an",@"Visitar: Xíimbaj"]};

    
    animalSectionTitles = [[animals allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    animalIndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    [[UITableView appearance] setTintColor:[UIColor grayColor]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [animalSectionTitles count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [animalSectionTitles objectAtIndex:section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionTitle = [animalSectionTitles objectAtIndex:section];
    NSArray *sectionAnimals = [animals objectForKey:sectionTitle];
    return [sectionAnimals count];
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return animalIndexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [animalSectionTitles indexOfObject:title];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    NSString *sectionTitle = [animalSectionTitles objectAtIndex:indexPath.section];
    NSArray *sectionAnimals = [animals objectForKey:sectionTitle];
    NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
    
    UILabel *item = (UILabel *) [cell viewWithTag:1];
    item.text = animal;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *v = (UITableViewHeaderFooterView *)view;
    v.backgroundView.backgroundColor = [UIColor colorWithRed:0.976 green:0.961 blue:0.718 alpha:1];;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
