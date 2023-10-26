package cn.lemon.lib.utils;

import cn.lemon.lib.entity.Menu;

import java.util.ArrayList;
import java.util.List;

public class TreeUtils {

    public static List<Menu> list2tree(List<Menu> list) {  //输入menu 队列 list
        List<Menu> tree = new ArrayList<>(); //新建menu队列 tree
        for (Menu node : list) {
            if (node.getParentId() == 0) {   // 如果 输入的menu队列中某个元素的父ID == 0
                tree.add(findChild(node,list)); // 则 在新建menu队列 中加入该值   ；
            }
        }
        return tree; //返回新建队列 （主页、用户管理、实验室管理、教务管理）
    }

    /**
     * 该方法输入根节点，并将它的所有子节点记录于列表中
     * @param node
     * @param list
     * @return
     */
    private static Menu findChild(Menu node, List<Menu> list) { //输入menu队列 list ，menu队列中元素的父ID为0的menu node。node即根节点。
        for (Menu n : list) {
            if (n.getParentId() == node.getId()) {      //如果 Menu队列中某个元素的父ID == 该node元素ID ； 即  Menu队列中某个元素 为 该node元素 的子元素
                if (node.getChild() == null) {          //则如果 该node元素 的子元素队列child 为空，
                    node.setChild(new ArrayList<Menu>());   //则 先创建该空队列
                }
                node.getChild().add(findChild(n,list)); //然后 为该空队列添加 该元素，即：Menu队列中某个元素；根节点的子节点n，输入menu队列 list。
            }
        }
        return node;  //最后返回 输入的 node元素
    }
}
