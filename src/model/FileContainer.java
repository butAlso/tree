package model;

import java.io.InputStream;

public class FileContainer {

    /**
     * 文件流
     */
    private InputStream fileInputStream;
    /**
     * 文件名
     */
    private String fileName;

    public InputStream getFileInputStream() {
        return fileInputStream;
    }

    public void setFileInputStream(InputStream fileInputStream) {
        this.fileInputStream = fileInputStream;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
