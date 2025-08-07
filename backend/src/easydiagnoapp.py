import json

from flask import *
import pymysql

from src.mainfile import make_pred, knn

# from src.mainfile import make_pred, knn

app=Flask(__name__)
con=pymysql.connect(host="localhost",user="root",password="root",db="easydiagno",charset="utf8")
cmd=con.cursor()
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
    data=request.form["doctors"]
    print(type(data))
    value=ast.literal_eval(data)
    print(value)
    print(type(value[0]))
    for i in value:
        result=value[0]
    id=result["id"]
    print(id)
    specialisationid=result["specialisation"]
    hospitalid = result["hospitalId"]
    name=result["doctorName"]
    qualification=result["qualification"]
    availabledays=result["availableDays"]
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
    img.save(fn)
    hospname=request.form["HospitalName"]
    print(hospname)
    email=request.form["Email"]
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
    # img=value["img"]
    # print(type(img))
    # print(img)
    # import time
    # fn = time.strftime("%Y%m%d_%H%M%S") + ".jpg"
    #
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

@app.route("/viewhospitalbyid",methods=['get'])
def viewhospitalbyid():
    hid=request.args.get("hospital_id")
    print(hid)
    cmd.execute("select * from hospital_details where login_id='"+hid+"'")
    ans=cmd.fetchall()
    print(ans)
    head=[x[0] for x in cmd.description]
    value=[]
    for result in ans:value.append(dict(zip(head,result)))
    print(value)
    return jsonify(value)

@app.route("/check",methods=['get','post'])
def check():
    sym=request.args.get('sym')
    # symp1 = "pain behind the eyes and in the joints, muscles and/or bones,severe headache.rash over most of the body."
    res = make_pred(knn, sym)
    print(res)
    return jsonify({'task':str(res)})

app.run(host='0.0.0.0',port=5000)
