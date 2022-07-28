import 'package:cloud_firestore/cloud_firestore.dart';

class InsertDataModel{


  void insertData() async {





    var db = FirebaseFirestore.instance.collection("admin");
  var result = await db.add({
     'mname' : 'far',
    'dname'       :  ' cancer',
     'searchD'    :  ["b", "br", "bra" , "brai", "brain " , "brain cancer" ],
     'searchkey'  :  ["b", "bl", "ble", "bleo","bleomycin"]





   });

    insertDataSubCollection(
      id: result.id
    );

  }
  void insertDataSubCollection({String? id}) async{
    var db = FirebaseFirestore.instance.collection("admin");

    db.doc(id).collection("admins").add({

      'injection': true,
      'injectionmg' : '15mg',
      'injectionprice' : '1000 PKR',
       'mformula'      : 'SWISS PHARMACEUTICAlS (PVT)LTD.',
        'mname'        : 'Bleomycin',

        'overview'     : 'Bleomycin is a cell cycle-phase specific drug from the'
            ' antibiotic class of antineoplastic drugs. its mechanism of action and '
            'spectrum of activity differentiate it from the other drugs in this class '
            'such as doxorubicin and etoposide. Bleomycin is produced by Streptomyces verticillus. '
            'The mixture of glycopeptides found in this extract are collectively reffered as it. '
            'A mixture of 11 different glycopeptide is used in therapy with the major components '
            'being it A2 and it B2.it exerts its chemotherapeutic effects by causing scission of '
            'single- and double stranded DNA. Bleomycin is used in combination of different types'
            ' of anticancerous drugs to obtain better therapeutic results and to reduce the side effects or toxicity.',


        'rdrug'        : 'Bleomycin',

        'risk'         : 'Drug should not be given to Paediatrics, Pregnant Mothers,'
            ' patients suffering from Liver Malfunction, Geriatrics, '
            'and Neonates.If prescribing authority justifies the benefits of '
            'the drug against the possible damages he/she should reevaluate them'
            ' and consult the reference material and previous studies.',

        'sideeffect'   : 'The severe or irreversible adverse effects of Bleomycin,'
            ' which give rise to further complications include Myelosuppressive effect, '
            'Mucocutaneous toxicity. Bleomycin produces potentially life-threatening effects which'
            ' include Pulmonary toxicity, Respiratory Failure. which are responsible for the discontinuation '
            'of Bleomycin therapy. The signs and symptoms that are produced after the acute overdosage of '
            'Bleomycin include Hypotension, Tachycardia, Fever. The symptomatic adverse reactions produced '
            'by Bleomycin are more or less tolerable and if they become severe, they can be treated symptomatically,'
            ' these include Headache, Nausea, Vomiting, Alopecia, Anorexia, Mucositis, Fever,'
            ' Chills, Rashes, Stomatitis, Mental confusion, SweatingX, Hypotension, Hyperthermia, Pruritis.',

         'storage'     : 'Inj Protect from Sunlight',


        'syrup'        : false,
        'syrupmg'      : '',
       'syrupprice'    : '',
       'tablet'        : false,
       'tabmg'        : '',
        'tabprice'    : '',

        'warning'     : 'Bleomycin should be used with caution in patients with kidney,'
            ' liver or lungs diseases. Before having surgery of any kind or emergency '
            'treatment, inform the doctor or dentist about the use of the drug. '
            'This medication is not recommended for use in pregnant or nursing women',



    });

  }




}
