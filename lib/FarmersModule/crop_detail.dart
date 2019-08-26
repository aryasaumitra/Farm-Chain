class CropDetails{
    String cropName;
    String cropQuantity;
    String cropPrice;
    String cropGrade;

    CropDetails(this.cropName, this.cropQuantity, this.cropPrice,this.cropGrade);

    static List<CropDetails> getCropList=[
        CropDetails('Basmati Rice','10 Kg','Rs. 20/Kg','A'),
        CropDetails('Urad Dal','100 Kg','Rs. 40/Kg','B'),
        CropDetails('Red Onion','10 Kg','Rs. 20/Kg','C'),
    ];


}