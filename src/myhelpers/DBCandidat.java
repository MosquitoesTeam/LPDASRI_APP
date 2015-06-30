package myhelpers;

import java.sql.*;
import java.util.ArrayList;

public class DBCandidat {
	public static int insert(Candidat candidat) {
		Connection con = DBUtil.dbConnect("inscription", "root", "");
		PreparedStatement ps = null;
		String query = "INSERT INTO CANDIDAT(email, nom, prenom, note, motPasse) "
				+ "VALUES (?, ?, ?, ?, ?)";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, candidat.getEmail());
			ps.setString(2, candidat.getNom());
			ps.setString(3, candidat.getPrenom());
			ps.setDouble(4, candidat.getNote());
			ps.setString(5, candidat.getMotPasse());
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
		}
	}

	public static int update(Candidat candidat, String email) {
		Connection con = DBUtil.dbConnect("inscription", "root", "");
		PreparedStatement ps = null;
		String query = "UPDATE CANDIDAT SET " + "email = ?, " + "nom = ?, "
				+ "prenom = ?, " + "note = ?, " + "motPasse = ? "
				+ "WHERE email = ?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, candidat.getEmail());
			ps.setString(2, candidat.getNom());
			ps.setString(3, candidat.getPrenom());
			ps.setDouble(4, candidat.getNote());
			ps.setString(5, candidat.getMotPasse());
			ps.setString(6, email);
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
		}
	}

	public static int delete(Candidat candidat) {
		Connection con = DBUtil.dbConnect("inscription", "root", "");
		PreparedStatement ps = null;
		String query = "DELETE FROM CANDIDAT WHERE Email = ?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, candidat.getEmail());
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
		}
	}

	public static boolean loginExists(String email, String motPasse) {
		Connection con = DBUtil.dbConnect("inscription", "root", "");
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT Email FROM CANDIDAT WHERE Email = ? AND motPasse = ?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, motPasse);
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
		}
	}

	public static Candidat selectCandidat(String email) {
		Connection con = DBUtil.dbConnect("inscription", "root", "");
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Candidat WHERE Email = ?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			Candidat candidat = null;
			if (rs.next()) {
				candidat = new Candidat();
				candidat.setEmail(rs.getString("Email"));
				candidat.setNom(rs.getString("nom"));
				candidat.setPrenom(rs.getString("prenom"));
				candidat.setNote(rs.getDouble("note"));
				candidat.setMotPasse(rs.getString("motPasse"));
			}
			return candidat;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
		}
	}

	public static ArrayList<Candidat> selectTousLesCandidats() {
		Connection con = DBUtil.dbConnect("inscription", "root", "");
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT * FROM Candidat";
		ArrayList<Candidat> listeCandidats = new ArrayList<Candidat>();
		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Candidat candidat = new Candidat();
				candidat.setEmail(rs.getString("Email"));
				candidat.setNom(rs.getString("nom"));
				candidat.setPrenom(rs.getString("prenom"));
				candidat.setNote(rs.getDouble("note"));
				candidat.setMotPasse(rs.getString("motPasse"));
				listeCandidats.add(candidat);
			}
			return listeCandidats;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
		}
	}
}