import json
from flask import *
import pymysql

from src.mainfile import make_pred, knn

# from src.mainfile import make_pred, knn

app=Flask(__name__)
con=pymysql.connect(host="localhost",user="root",password="root",db="easydiagno",charset="utf8")
cmd=con.cursor()
# import smtplib
# from email.mime.text import MIMEText
# from cryptography.fernet import Fernet


@app.route("/login_check",methods=['get','post'])
def login_check():
    email=request.args.get("email")
    passw=request.args.get("password")
    cmd.execute("select * from login where email='"+email+"' and password='"+passw+"'")
    result=cmd.fetchone()
    if result is None:
        return jsonify({'task':'invalid'})
    else:
        return jsonify({'task':'success','lid':result[0],'type':result[3]})
@app.route("/specialization",methods=['get','post'])
def specialization():
    description=request.args.get("description")
    specialization=request.args.get("specialization")
    cmd.execute("insert into specialization values(null,'"+description+"','"+specialization+"')")
    con.commit()
    return  jsonify({'task':'success'})
@app.route("/doctordetails",methods=['post','get'])
@app.route("/doctordetails",methods=['post','get'])
def doctordetails():
    import ast
    print(request.form)
    data=request.form["doctors"]
    print(type(data))
    value=ast.literal_eval(data)
    print(value)
    print(type(value[0]))
    for i in value:
        result=value[0]
        id=result["id"]
        print("loooooooooooop",i)
        specialisationid=i["specialisation"]
        hospitalid = i["hospitalId"]
        name=i["doctorName"]
        qualification=i["qualification"]
        availabledays=i["availableDays"]
        days=','.join(availabledays)

        cmd.execute("insert into doctor_details values(null,'"+id+"','"+hospitalid+"','"+specialisationid+"','"+name+"','"+qualification+"','"+days+"')")
        con.commit()
    print("ok")
    return  jsonify({'task':'success'})
@app.route("/user",methods=['get','post'])
def user():
    email = request.args.get("email")
    passw = request.args.get("password")
    cmd.execute("insert into login values(null,'" + email + "','" + passw + "','user')")
    con.commit()
    login_id=cmd.lastrowid
    name=request.args.get("name")
    cmd.execute("insert into user_profile values(null,'"+str(login_id)+"','"+name+"','"+email+"',null,null,null,null,null,null)")
    con.commit()
    return  jsonify({'task':'success'})
@app.route("/userupdate",methods=['get','post'])
def userupdate():
    userid=request.args.get("userid")
    phone_number=request.args.get("phone_number")
    gender=request.args.get("gender")
    height=request.args.get("height")
    weight=request.args.get("weight")
    pincode=request.args.get("pincode")
    address=request.args.get("address")
    cmd.execute("update user_profile set phone_number='"+phone_number+"',gender='"+gender+"',height='"+height+"',weight='"+weight+"',pincode='"+pincode+"',adress='"+address+"' where userid='"+userid+"' ")
    con.commit()
    return jsonify({ 'task':'success'})
@app.route("/hospitalregistration",methods=["post"])
def hospitalregistration():
    print(type(request.form))
    print(request.files)
    img=request.files["img"]
    import  time
    fn = time.strftime("%Y%m%d_%H%M%S") + ".jpg"
    print(fn)
    save_location="./static/hospital/"+fn
    img.save(save_location)
    hospname=request.form["HospitalName"]
    print(hospname)
    email=request.form["Email"]
    print(email)
    liscencenum=request.form["LiscenceNumber"]

    addresslines=request.form["Address"]
    print(type(addresslines))
    addressline=json.loads(addresslines)
    add=addressline['AddressLine']
    print(add)
    pincode=addressline["PinCode"]
    country=addressline["Country"]
    state=addressline["State"]
    city=addressline["City"]
    phone=request.form["phone"]

    cmd.execute("insert into login values(null,'"+email+"','0','pending')")
    con.commit()
    loginid=cmd.lastrowid
    cmd.execute("insert into  hospital_details values(null,'"+str(loginid)+"','"+hospname+"','"+email+"','"+phone+"','"+liscencenum+"','"+add+"','"+pincode+"','"+country+"','"+state+"','"+city+"','"+str(fn)+"')")
    con.commit()
    return  jsonify({'task':'success'})

@app.route("/viewspecialisation",methods=['get','post'])
def viewspecialisation():
    cmd.execute("select * from specialisation")
    s=cmd.fetchall()
    row_headers=[x[0] for x in cmd.description]
    json_data=[]
    for result in s: json_data.append(dict(zip(row_headers,result)))
    return jsonify(json_data)

@app.route("/viewhospital")
def viewhospital():
    hid=request.args.get("hospital_id")
    cmd.execute("SELECT specialisation.*,doctor_details.*,hospital_details.*FROM specialisation JOIN doctor_details ON specialisation.specialisation_id=doctor_details.specialisation_id JOIN hospital_details ON hospital_details.hospital_id=doctor_details.hospital_id where hospital_details.hospital_id='"+hid+"'")
    ans=cmd.fetchall()
    head=[x[0] for x in cmd.description]
    value=[]
    for result in ans:value.append(dict(zip(head,result)))
    print(value)
    return jsonify(value)

@app.route("/viewhospitalBycategory")
def viewhospitalsBycategory():
    category=request.args.get("specialisation")
    cmd.execute("SELECT specialisation.*,doctor_details.*,hospital_details.*FROM specialisation JOIN doctor_details ON specialisation.specialisation_id=doctor_details.specialisation_id JOIN hospital_details ON hospital_details.hospital_id=doctor_details.hospital_id where specialisation.specialisation='"+category+"'")
    ans=cmd.fetchall()
    head=[x[0] for x in cmd.description]
    value=[]
    for result in ans:value.append(dict(zip(head,result)))
    print(value)
    return jsonify(value)

@app.route("/viewhospitalbyid",methods=['get'])
def viewhospitalbyid():
    hid=request.args.get("hospital_id")
    print(hid)
    cmd.execute("select * from hospital_details where login_id='"+hid+"'")
    ans=cmd.fetchall()
    print("anssssssssssssssssss",ans)
    head=[x[0] for x in cmd.description]
    value=[]
    for result in ans:value.append(dict(zip(head,result)))
    print(value)
    return jsonify(value)

@app.route("/viewpendinghospital",methods=['get','post'])
def viewpendinghospital():
    cmd.execute("SELECT hospital_details.*,login.type FROM hospital_details JOIN login ON hospital_details.login_id=login.loginid WHERE login.type='pending'")
    res=cmd.fetchall()
    print("vvvvvvvvvvvvvvvvvvvvvvvvvv",res)
    head = [x[0] for x in cmd.description]
    value = []
    for result in res: value.append(dict(zip(head, result)))
    print(value)
    return jsonify(value)

@app.route("/updatehospital",methods=['get','post'])
def updatehospital():
    lid=request.args.get("lid")
    cmd.execute("update login set type='hospital' where loginid='"+lid+"'")
    con.commit()
    return jsonify({'task':'success'})

@app.route("/rejecthospital",methods=['get','post'])
def rejecthospital():
    lid=request.args.get("lid")
    cmd.execute("update login set type='rejected' where loginid='"+lid+"'")
    con.commit()
    return jsonify({'task':'success'})



@app.route("/check",methods=['get','post'])
def check():
    sym=request.args.get('sym')
    # symp1 = "pain behind the eyes and in the joints, muscles and/or bones,severe headache.rash over most of the body."
    res = make_pred(knn, sym)
    print(res)
    return jsonify({'task':str(res)})




@app.route("/viewdocterbyhospitalid", methods=['GET'])
def viewdocterbyhospitalid():
    # @app.route("/viewdocterbyhospitalid", methods=['GET'])
    # def viewdocterbyhospitalid():
        hid = request.args.get("hospital_id")
        cmd.execute("""
        SELECT 
            h.*, 
            sp.specialisation,
            JSON_OBJECT(
                'doctor_id', d.d_id, 
                'doctor_name', d.doctor_name, 
                'qualification', d.qualification, 
                'available_days', d.available_days
            ) AS doctor_info
        FROM 
            hospital_details h
        LEFT JOIN 
            doctor_details d ON h.hospital_id = d.hospital_id
        LEFT JOIN 
            specialisation sp ON d.specialisation_id = sp.specialisation_id
        WHERE 
            h.login_id = %s
        """, (hid,))

        ans = cmd.fetchall()
        hospital_data = {}

        for row in ans:
            hospital_id = row[0]
            login_id = row[1]
            hospital_name = row[2]
            email = row[3]
            phone_number = row[4]
            licence_number = row[5]
            address_line = row[6]
            pincode = row[7]
            country = row[8]
            state = row[9]
            city = row[10]
            specialization = row[11]
            doctor_info = json.loads(row[12])  # Parse JSON string into dictionary

            if hospital_id not in hospital_data:
                hospital_data[hospital_id] = {
                    'hospital_id': hospital_id,
                    'login_id': login_id,
                    'hospital_name': hospital_name,
                    'email': email,
                    'phone_number': phone_number,
                    'licence_number': licence_number,
                    'address_line': address_line,
                    'pincode': pincode,
                    'country': country,
                    'state': state,
                    'city': city,
                    'doctors_list': {}
                }

            if specialization not in hospital_data[hospital_id]['doctors_list']:
                hospital_data[hospital_id]['doctors_list'][specialization] = []

            if doctor_info:
                doctor = {
                    'doctor_id': doctor_info['doctor_id'],
                    'doctor_name': doctor_info['doctor_name'],
                    'qualification': doctor_info['qualification'],
                    'available_days': doctor_info['available_days']
                }
                hospital_data[hospital_id]['doctors_list'][specialization].append(doctor)

        # Transforming doctors list structure
        for hospital_id, hospital_details in hospital_data.items():
            doctors_by_specialization = []
            for specialization, doctors in hospital_details['doctors_list'].items():
                doctors_by_specialization.append({'specialization': specialization, 'doctors': doctors})
            hospital_details['doctors_list'] = doctors_by_specialization

        return jsonify(list(hospital_data.values()))


def selectallnew(qry,val):
    con = pymysql.connect(host="localhost", user="root", password="root", db="easydiagno", charset="utf8")
    cmd = con.cursor()
    cmd.execute(qry,val)
    res=cmd.fetchall()
    return res


app.run(host='0.0.0.0',port=5000)
