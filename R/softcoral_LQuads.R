#' @title Sample Quadrat Data (1m by 1m)
#'
#' @description A \code{data_frame} that can be used with the cleaning vignette
#'     to show how quadrat data can be cleaned to produce easy to analyze data
#'     frames. Data was collected by the [Baum Lab](https://www.juliakbaum.org/)
#'     and Kiritimati Field Teams. Data is the uncleaned version of data found in
#'     [Maucieri and Baum 2021. Biological Conservation.](https://doi.org/10.1016/j.biocon.2021.109328)
#'     The data are from photo quadrats (1m by 1m) which were randomly annotated
#'     with 100 random points each. At each of these annotated points, the substrate
#'     was identified. Photo quadrats were collected on Kiritimati Island in the
#'     Republic of Kiribati and document coral cover over time and space. The
#'     annotations and output of the \code{data_frame} were produced using
#'     [CoralNet](https://coralnet.ucsd.edu/) and all annotations were done manually,
#'     by trained researchers.
#'
#' @format A \code{data_frame} with 135 columns, which are:
#' \describe{
#' \item{Image.ID}{Photo quadrat image ID from [CoralNet](https://coralnet.ucsd.edu/)}
#' \item{Image.name}{The photo quadrat image name}
#' \item{Annotation.status}{If the quadrat has been completely annotated, or if there
#'     are more annotations to occur}
#' \item{Points}{The total number of annotation points in the quadrat}
#' \item{AcCor}{Number of points annotated for Acropora (corymbose morphology)}
#' \item{AcDig}{Number of points annotated for Acropora (digitate morphology)}
#' \item{Acr_arb}{Number of points annotated for Acropora (arborescent morphology)}
#' \item{Acrop}{Number of points annotated for Acropora}
#' \item{AcroTab}{Number of points annotated for Acropora (tabulate morphology)}
#' \item{Astreo}{Number of points annotated for Astreopora}
#' \item{B_Acr_arb}{Number of points annotated for bleached Acropora (arborescent morphology)}
#' \item{B_Acro}{Number of points annotated for bleached Acropora}
#' \item{B_Astre}{Number of points annotated for bleached Astreopora}
#' \item{BAT}{Number of points annotated for bleached Acropora (tabulate morphology)}
#' \item{B_Cosc}{Number of points annotated for bleached Coscinarea}
#' \item{B_Echin}{Number of points annotated for bleached Echinophyllia}
#' \item{B_FavHal}{Number of points annotated for bleached Favites halicora}
#' \item{B_Favia}{Number of points annotated for bleached_Favia}
#' \item{B_FaviaM}{Number of points annotated for bleached Favia matthai}
#' \item{B_FaviaS}{Number of points annotated for bleached Favia speciosa}
#' \item{B_FaviaSt}{Number of points annotated for bleached Goniastrea stelligera}
#' \item{B_Favites}{Number of points annotated for bleached Favites}
#' \item{B_FavPent}{Number of points annotated for bleached Favites pentagona}
#' \item{B_Fung}{Number of points annotated for bleached Fungia}
#' \item{BGard}{Number of points annotated for bleached Gardineroseris}
#' \item{B_GonEd}{Number of points annotated for bleached Goniastrea edwardsi}
#' \item{B_Herpo}{Number of points annotated for bleached Herpolitha}
#' \item{B_HYDNO}{Number of points annotated for bleached Hydnophora}
#' \item{B_HyExe}{Number of points annotated for bleached Hydnophora exesa}
#' \item{BlAcro-Cor}{Number of points annotated for bleached Acropora (corymbose morphology)}
#' \item{B_Lepta}{Number of points annotated for bleached Leptastrea}
#' \item{B_Lepto}{Number of points annotated for bleached Leptoseris}
#' \item{Blisop}{Number of points annotated for bleached Isopora}
#' \item{B_Lobo}{Number of points annotated for bleached Lobophyllia}
#' \item{BlTurbFol}{Number of points annotated for bleached Turbinaria (foliose morphology)}
#' \item{B_MOEN}{Number of points annotated for bleached Montipora (encrusting morphology)}
#' \item{B_MOFO}{Number of points annotated for bleached Montipora (foliose morphology)}
#' \item{B_Monta}{Number of points annotated for bleached Montastraea}
#' \item{B_Monti}{Number of points annotated for bleached Montipora}
#' \item{B_Oxyp}{Number of points annotated for bleached Oxypora}
#' \item{B_Paly}{Number of points annotated for bleached Palythoa}
#' \item{B_PaveDUER}{Number of points annotated for bleached Pavona duerdeni}
#' \item{B_Pavona}{Number of points annotated for bleached Pavona}
#' \item{B_PEYDO}{Number of points annotated for bleached Pocillopora eydouxi}
#' \item{B_Plat}{Number of points annotated for bleached Platygyra}
#' \item{B_PMEAN}{Number of points annotated for bleached Pocillopora meandrina}
#' \item{B_Pocillo}{Number of points annotated for bleached Pocillopora}
#' \item{B_Porit}{Number of points annotated for bleached Porites}
#' \item{B_Psam}{Number of points annotated for bleached Psammocora}
#' \item{B_PVAR}{Number of points annotated for bleached Pavona varians}
#' \item{B_Sando}{Number of points annotated for bleached Sandolitha}
#' \item{B_UnkCoral}{Number of points annotated for bleached unknown hard coral}
#' \item{Cirr}{Number of points annotated for Cirrhipathes}
#' \item{COSC}{Number of points annotated for Coscinaraea}
#' \item{ECHIN}{Number of points annotated for Echinophyllia}
#' \item{Fav}{Number of points annotated for Favites}
#' \item{FavHal}{Number of points annotated for Favites halicora}
#' \item{Favites halicora}{Number of points annotated for Favia}
#' \item{FaviaM}{Number of points annotated for Dipsastraea matthai}
#' \item{FaviaS}{Number of points annotated for Favia speciosa}
#' \item{FaviaSt}{Number of points annotated for Favia stelligera}
#' \item{FavPent}{Number of points annotated for Favites pentagona}
#' \item{Fung}{Number of points annotated for Fungia}
#' \item{Gardin}{Number of points annotated for Gardineroseris}
#' \item{GonEd}{Number of points annotated for Goniastrea edwardsi}
#' \item{Herpo}{Number of points annotated for Herpolitha}
#' \item{HYDNO}{Number of points annotated for Hydnophora}
#' \item{HyExe}{Number of points annotated for Hydnophora exesa}
#' \item{Isopora}{Number of points annotated for Isopora}
#' \item{Lepta}{Number of points annotated for Leptastrea}
#' \item{Lepto}{Number of points annotated for Leptoseris}
#' \item{Lobo}{Number of points annotated for Lobophyllia}
#' \item{*MOEN}{Number of points annotated for Montipora (encrusting morphology)}
#' \item{*MOFO}{Number of points annotated for Montipora (foliose morphology)}
#' \item{Monta}{Number of points annotated for Montastraea}
#' \item{Monti}{Number of points annotated for Montipora}
#' \item{Oxyp}{Number of points annotated for Oxypora}
#' \item{Paly}{Number of points annotated for Palythoa}
#' \item{PaveDUER}{Number of points annotated for Pavona duerdeni}
#' \item{Pavon}{Number of points annotated for Pavona}
#' \item{PEYDO}{Number of points annotated for Pocillopora eydouxi}
#' \item{Plat}{Number of points annotated for Platygyra}
#' \item{Plero}{Number of points annotated for Plerogyra}
#' \item{PMEAN}{Number of points annotated for Pocillopora meandrina}
#' \item{Pocill}{Number of points annotated for Pocillopora}
#' \item{Porit}{Number of points annotated for Porites}
#' \item{Psam}{Number of points annotated for Psammocora}
#' \item{PVAR}{Number of points annotated for Pavona varians}
#' \item{Sando}{Number of points annotated for Sandolitha}
#' \item{Tuba}{Number of points annotated for Tubastrea}
#' \item{TURB}{Number of points annotated for Turbinaria}
#' \item{UnkCoral}{Number of points annotated for unknown hard coral}
#' \item{ANEM}{Number of points annotated for sea anemone}
#' \item{B_Clad}{Number of points annotated for bleached Cladiella}
#' \item{B_Sinu}{Number of points annotated for bleached Sinularia}
#' \item{Clad}{Number of points annotated for Cladiella}
#' \item{EncBry}{Number of points annotated for encrusting Bryozoan}
#' \item{EUR}{Number of points annotated for sea urchin}
#' \item{HYDCO}{Number of points annotated for Hydrocoral}
#' \item{Hydra}{Number of points annotated for Hydroid}
#' \item{Mille}{Number of points annotated for Millepora}
#' \item{MOBI}{Number of points annotated for bivalves}
#' \item{Sarco}{Number of points annotated for Sarcophyton}
#' \item{SECO}{Number of points annotated for sea cucumber}
#' \item{Sinu}{Number of points annotated for Sinularia}
#' \item{Sponge}{Number of points annotated for sponge}
#' \item{Stylas}{Number of points annotated for Stylaster}
#' \item{UnkTUN}{Number of points annotated for unknown Tunicate}
#' \item{XmasW}{Number of points annotated for Christmas Tree Worm}
#' \item{ZOAN}{Number of points annotated for Zoanthid}
#' \item{B_Sarco}{Number of points annotated for bleached Sarcophyton}
#' \item{Sand}{Number of points annotated for sand}
#' \item{Sediment}{Number of points annotated for sediment}
#' \item{SCRO}{Number of points annotated for consolidated rock}
#' \item{B_Loph}{Number of points annotated for bleached Lobophytum}
#' \item{CYAN}{Number of points annotated for Cyanobacteria films}
#' \item{Loph}{Number of points annotated for Lobophytum}
#' \item{Rubble}{Number of points annotated for broken coral rubble}
#' \item{SHAD}{Number of points annotated for shadow}
#' \item{Trans}{Number of points annotated for transect hardware}
#' \item{Unc}{Number of points annotated for unclear}
#' \item{AVRA}{Number of points annotated for Avrainvillea}
#' \item{Caul}{Number of points annotated for Caulerpa}
#' \item{CCA}{Number of points annotated for crustose coraline algae}
#' \item{Dict}{Number of points annotated for Dictyota}
#' \item{DICTY}{Number of points annotated for Dictyosphaeria}
#' \item{Hali}{Number of points annotated for Halimeda}
#' \item{Lobph}{Number of points annotated for Lobophora}
#' \item{Macro}{Number of points annotated for macroalgae}
#' \item{Mdict}{Number of points annotated for Microdictyon}
#' \item{Pad}{Number of points annotated for Padina}
#' \item{Peysson}{Number of points annotated for Peyssonnelia}
#' \item{Turf}{Number of points annotated for turf algae}
#' \item{TURFH}{Number of points annotated for turf algae on hard substrate}
#' \item{Unidentified}{Number of points annotated that were unidentified}
#' }
"softcoral_LQuads"
