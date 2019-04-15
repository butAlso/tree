package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FileContainer;

import model.TreeInfo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import tree.CtrlSql;

@WebServlet(name = "AddTreeInfoServlet", urlPatterns = "/addTreeInfoServlet")
public class AddTreeInfoServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/json; charset=utf-8");

        String path = req.getRealPath("/images");
        ServletFileUpload upload = getServletFileUpload(path);

        try {
            List<FileItem> items = upload.parseRequest(req);

            TreeInfo treeInfo = new TreeInfo();
            for (FileItem item: items) {
                String fieldName = item.getFieldName();
                if (item.isFormField()) {
                    // 表单信息
                    setTreeInfo(treeInfo, fieldName, item.getString("UTF-8"));
                } else {
                    // 文件流
                    String filename = item.getName();
                    InputStream uploadFile = null;
                    // 获取上传文件的文件流
                    try {
                        uploadFile = item.getInputStream();
                    } catch (IOException e) {
                        System.err.println("获取文件上传流失败！");
                    }
                    FileContainer container = new FileContainer();
                    container.setFileName(filename);
                    container.setFileInputStream(uploadFile);
                    setTreeInfo(treeInfo, fieldName, container);

                    // 存储文件
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    String houzhui = filename.substring(filename.lastIndexOf("."));
                    String rename = UUID.randomUUID() + houzhui;
                    item.write(new File(path, rename));
                }
            }

            // 存储到数据库
            storeToDB(treeInfo);
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 返回信息
        String res = "{\"status\":200,\"msg\":\"OK\"}";
        PrintWriter out = resp.getWriter();
        out.print(res);
    }

    private void storeToDB(TreeInfo treeInfo) {
        String sql = "insert into tree(id,name,latin,another,classify,trunk,leaf,flower,seed,cro,chord) values('" +
                treeInfo.getId() + "','" + treeInfo.getName() + "','" + treeInfo.getLatin() + "','"
                + treeInfo.getAnother() + "','" + treeInfo.getClassify() + "','" + treeInfo.getTrunkImg() + "','" +
                treeInfo.getLeafImg() + "','" + treeInfo.getFlowerImg() + "','" + treeInfo.getSeedImg() + "','" +
                treeInfo.getCroImg() + "','" + treeInfo.getCroImg() + "')";
        CtrlSql conn = new CtrlSql();
        conn.conn();
        conn.update(sql);
    }


    private ServletFileUpload getServletFileUpload(String repoPath) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(4096);
        // the location for saving data that is larger than getSizeThreshold()
        factory.setRepository(new File(repoPath));

        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum size before a FileUploadException will be thrown
        upload.setSizeMax(1000000);
        return upload;
    }

    private void setTreeInfo(TreeInfo treeInfo, String fieldName, Object fieldValue) {
        // 对应form中属性的名字
        switch (fieldName) {
            case "id":
                treeInfo.setId((String)fieldValue);
                break;
            case "name":
                treeInfo.setName((String)fieldValue);
                break;
            case "latin":
                treeInfo.setLatin((String)fieldValue);
                break;
            case "another":
                treeInfo.setAnother((String)fieldValue);
                break;
            case "classify":
                treeInfo.setClassify((String)fieldValue);
                break;
            case "trunkImg":
                treeInfo.setTrunkImg((FileContainer)fieldValue);
                break;
            case "leafImg":
                treeInfo.setLeafImg((FileContainer)fieldValue);
                break;
            case "flowerImg":
                treeInfo.setFlowerImg((FileContainer)fieldValue);
                break;
            case "seedImg":
                treeInfo.setSeedImg((FileContainer)fieldValue);
                break;
            case "croImg":
                treeInfo.setCroImg((FileContainer)fieldValue);
                break;
            case "chordImg":
                treeInfo.setChordImg((FileContainer)fieldValue);
                break;
                default:
                    System.err.println("bad filedName: " + fieldName);
        }
    }
}

