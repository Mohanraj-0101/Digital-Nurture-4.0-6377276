abstract class WordDocument{
    public abstract void create();
}

abstract class PdfDocument{
    public abstract void create();

}

abstract class ExcelDocument{
    public abstract void create();
}

class ConcreteWord extends WordDocument{
    @Override
    public void create(){
        System.out.println("Created the word Document");
    }
}
class ConcretePdf extends PdfDocument{
    @Override
    public void create(){
        System.out.println("Created the pdf Document");
    }
}
class ConcreteExcel extends ExcelDocument{
    @Override
    public void create(){
        System.out.println("Created the excel Document");

    }
}


//Factory

abstract class DocumentFactory{
    public abstract void createDocument();
}

class wordFactory extends DocumentFactory{
    @Override
    public void createDocument(){
        WordDocument word = new ConcreteWord();
        word.create();
    }
}

class pdfFactory extends DocumentFactory{
    @Override
    public void createDocument(){
        PdfDocument pdf = new ConcretePdf();
        pdf.create();
    }
}

class excelFactory extends DocumentFactory{
    @Override
    public void createDocument(){
        ExcelDocument excel = new ConcreteExcel();
        excel.create();
    }
}
public class FactoryMethodPattern {
    public static void main(String[] args) {
        DocumentFactory word_factory = new wordFactory();
        word_factory.createDocument();

        DocumentFactory pdf_factory = new pdfFactory();
        pdf_factory.createDocument();

        DocumentFactory excel_factory = new excelFactory();
        excel_factory.createDocument();
    }
}
