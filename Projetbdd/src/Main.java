/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.*;

/**
 *
 * @author brend
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/gestionnotes?serverTimezone=UTC", "root", "root");

            Statement stmt = con.createStatement();

            // the mysql insert statement
            String query = " insert into Eleve (EleveMat, NomE, PrenomE, NumRueE, CodePostE, VilleE, TelE, EmailE, DateNaissanceE, VilleNaissanceE, PaysNaissanceE, SexeE,Photo,NomG, NomPromo, ContactID)"
                    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // create the mysql insert preparedstatement
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, 20190009);
            preparedStmt.setString(2, "VERDANA");
            preparedStmt.setString(3, "Julien");
            preparedStmt.setString(4, "10 rue Jean Macé");
            preparedStmt.setInt(5, 91100);
            preparedStmt.setString(6, "Corbeil");
            preparedStmt.setLong(7, 0615245202);
            preparedStmt.setString(8, "julien@efrei.net");
            preparedStmt.setString(9, "1985-12-12");
            preparedStmt.setString(10, "Paris");
            preparedStmt.setString(11, "France");
            preparedStmt.setString(12, "M");
            preparedStmt.setInt(13, 54455354);
            preparedStmt.setString(14, "A");
            preparedStmt.setString(15, "L3");
            preparedStmt.setInt(16, 1);

            // execute the preparedstatement
            //preparedStmt.execute();
            
            ResultSet rs = stmt.executeQuery("select EleveMat, NomE, PrenomE from eleve");
            int i = 1;
            while (rs.next()) {

                int mat = rs.getInt("EleveMat");
                String nom = rs.getString("NomE");
                String prenom = rs.getString("PrenomE");

                System.out.println("Eleve " + i);
                System.out.println("Matricule : " + mat + "\nNom : " + nom + "\nPrénom : " + prenom + "\n\n");
                i++;
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
