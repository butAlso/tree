package model;

public class TreeInfo {
    FileContainer trunkImg;
    FileContainer leafImg;
    FileContainer flowerImg;
    FileContainer seedImg;
    FileContainer croImg;
    FileContainer chordImg;

    String id;
    String name;
    String latin;
    String another;
    String classify;

    public FileContainer getTrunkImg() {
        return trunkImg;
    }

    public void setTrunkImg(FileContainer trunkImg) {
        this.trunkImg = trunkImg;
    }

    public FileContainer getLeafImg() {
        return leafImg;
    }

    public void setLeafImg(FileContainer leafImg) {
        this.leafImg = leafImg;
    }

    public FileContainer getFlowerImg() {
        return flowerImg;
    }

    public void setFlowerImg(FileContainer flowerImg) {
        this.flowerImg = flowerImg;
    }

    public FileContainer getSeedImg() {
        return seedImg;
    }

    public void setSeedImg(FileContainer seedImg) {
        this.seedImg = seedImg;
    }

    public FileContainer getCroImg() {
        return croImg;
    }

    public void setCroImg(FileContainer croImg) {
        this.croImg = croImg;
    }

    public FileContainer getChordImg() {
        return chordImg;
    }

    public void setChordImg(FileContainer chordImg) {
        this.chordImg = chordImg;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLatin() {
        return latin;
    }

    public void setLatin(String latin) {
        this.latin = latin;
    }

    public String getAnother() {
        return another;
    }

    public void setAnother(String another) {
        this.another = another;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }
}
