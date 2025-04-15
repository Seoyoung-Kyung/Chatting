import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;

class InviteMessageBox extends JDialog implements ActionListener
{
	
  private WaitRoom waitRoom;
  private Container c;
  private JButton bt;
  private JList waiterInfo;

  public InviteMessageBox(JFrame parent, String title, String message){
    super(parent, false);
    waitRoom = new WaitRoom();
    setTitle(title);
    c = getContentPane();
    c.setLayout(null);
    JLabel lbl = new JLabel(message);
    lbl.setFont(new Font("SanSerif", Font.PLAIN, 12));
    lbl.setBounds(20, 10, 190, 20);
    c.add(lbl);
    
    JDialog dialog = new JDialog();
    dialog.setTitle("대기실 사용자 목록");
    dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
    dialog.setSize(200, 250);
    dialog.setLocationRelativeTo(this);
    dialog.setModal(true);

    JPanel panel = new JPanel();
    panel.setBorder(new TitledBorder(new EtchedBorder(EtchedBorder.LOWERED), "대기자"));

    String userList = waitRoom.getUsers();
    String[] userListArray = userList.split("'");

    waiterInfo = new JList(userListArray);
    waiterInfo.setFont(new Font("SanSerif", Font.PLAIN, 12));
    JScrollPane scrollPane = new JScrollPane(waiterInfo);
    scrollPane.setPreferredSize(new Dimension(160, 200));

    panel.add(scrollPane);
    dialog.setContentPane(panel);

    dialog.setVisible(true);

    bt = new JButton("확 인");
    bt.setBounds(60, 40, 70, 25);
    bt.setFont(new Font("SanSerif", Font.PLAIN, 12));
    bt.setBorder(new SoftBevelBorder(SoftBevelBorder.RAISED));
    bt.addActionListener(this);
    c.add(bt);

    Dimension dim = getToolkit().getScreenSize();
    setSize(200, 100);
    setLocation(dim.width/2 - getWidth()/2,
                dim.height/2 - getHeight()/2);
    show();
    addWindowListener(
      new WindowAdapter(){
        public void windowClosing(WindowEvent e){
          dispose();
        }
      }
    );
  }

  public void actionPerformed(ActionEvent ae){
    if(ae.getSource() == bt){
      dispose();
    }
  }
}
