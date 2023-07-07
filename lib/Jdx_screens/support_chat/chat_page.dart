import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:job_dekho_app/Model/chat_messages_response.dart';
import 'package:job_dekho_app/Model/send_chat_message_response.dart';
import 'package:job_dekho_app/Utils/api_path.dart';
import 'package:job_dekho_app/Utils/color.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Chat extends StatefulWidget {
  final String? id, status;
  const Chat({Key? key, this.id, this.status}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

StreamController<String>? chatstreamdata;

class _ChatState extends State<Chat> {
  TextEditingController msgController =  TextEditingController();
  List<File> files = [];
  List<dynamic> chatList = [];
  List<ChatDataList> finalChatList = [];
  late Map<String?, String> downloadlist;
  String _filePath = "";
  bool isLoading = false;

  ScrollController _scrollController =  ScrollController();

  String? roles;
  String? uid;
  String? type;
  String? userName;
  String? userPic;
  String? wallet;



  getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('userid');
    //type = prefs.getString('TokenString.type');
    //roles = prefs.getString('TokenString.roles');
    //userName = prefs.getString('TokenString.userName');
    //userPic = prefs.getString('TokenString.userPic');
    //wallet = prefs.getString('TokenString.walletBalance');
    // currentAddress =prefs.getString(TokenString.deviceToken);
    // print("roles here ${roles.toString()} aaand ${type.toString()} &&& ${uid.toString()}");
  }

  @override
  void initState() {
    super.initState();
    downloadlist =  Map<String?, String>();
    //CUR_TICK_ID = widget.id;
    // FlutterDownloader.registerCallback(downloadCallback);
    // setupChannel();
    getSharedData();
    getChatMessage();

    //getMsg();
  }

  @override
  void dispose() {
   // CUR_TICK_ID = '';
    if (chatstreamdata != null) chatstreamdata!.sink.close();

    super.dispose();
  }

  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port')!;
  //   send.send([id, status, progress]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          centerTitle: true,
          title: const Text("Chat"),

        ),
        // getAppBar(getTranslated(context, 'CHAT')!, context),
        body: Container(
            padding: const EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                )),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration:  BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  )),
              child: Column(
                children: <Widget>[buildListMessage(), msgRow()],
              ),
            )));
  }

  void setupChannel() {
    chatstreamdata = StreamController<String>(); //.broadcast();
    chatstreamdata!.stream.listen((response) {
      setState(() {
        final res = json.decode(response);
        /*Model*/ String message;
        String mid;

        message = "Model.fromChat(res[data])";

        chatList.insert(0, message);
        files.clear();
      });
    });
  }

  void insertItem(String response) {
    if (chatstreamdata != null) chatstreamdata!.sink.add(response);
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  Widget buildListMessage() {
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) => msgItem(index, finalChatList[index]),
        itemCount: finalChatList.length,
        reverse: true,
        controller: _scrollController,
      ),
    );
  }

  Widget msgItem(int index,ChatDataList message)
  {
    // if (message.uid == context.read<SettingProvider>().userId) {
    //Own message
    return Row(
      mainAxisAlignment:
      message.userType == 'user' ?
          MainAxisAlignment.end
       : MainAxisAlignment.start,
      children: <Widget>[
        // Flexible(
        //   flex: 1,
        //   child: Container(),
        // ),
        Flexible(
          flex: 2,
          child: MsgContent(index, message),
        ),
      ],
    );

  }

  Widget MsgContent(int index, ChatDataList message) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: message.userType == 'user'
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        // message.uid == userId
        //     ? Container()
        //     :
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

            ],
          ),
        ),
        ListView.builder(
            itemBuilder: (context, index) {
              return attachItem(message.attachments ?? [], index, message);
            },
            itemCount: message.attachments!.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true),
        message.message != null && message.message!.isNotEmpty
            ? Card(
                elevation: 0.0,
                color: message.userType == 'user'
                    // settingsProvider.userId
                    ? Colors.white.withOpacity(0.1)
                    : primaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Column(
                    crossAxisAlignment: message.userType == 'user'
                        // settingsProvider.userId
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("${message.message}",
                          style: TextStyle(
                              color: message.userType == 'user'
                                  ? Colors.black
                                  : Colors.white)),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 5),
                        child: Text(message.dateCreated!,
                            style: TextStyle(
                                color: message.userType == 'user'
                                    ? Colors.black45
                                    : Colors.white,
                                fontSize: 9)),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  void _requestDownload(String? url, String? mid) async {
    bool checkpermission = await Checkpermission();
    if (checkpermission) {
      if (Platform.isIOS) {
        Directory target = await getApplicationDocumentsDirectory();
        _filePath = target.path.toString();
      } else {
        Directory target = await getApplicationDocumentsDirectory();
        _filePath = target.path.toString();
      }

      String fileName = url!.substring(url.lastIndexOf("/") + 1);
      File file = new File(_filePath + "/" + fileName);
      bool hasExisted = await file.exists();

      if (downloadlist.containsKey(mid)) {
        // final tasks = await FlutterDownloader.loadTasksWithRawQuery(
        //     query:
        //         "SELECT status FROM task WHERE task_id=${downloadlist[mid]}");

        // if (tasks == 4 || tasks == 5) downloadlist.remove(mid);
      }

      if (hasExisted) {
        // final _openFile = await OpenFile.open(_filePath + "/" + fileName);
      } else if (downloadlist.containsKey(mid)) {
        setSnackbar("Downloading"
            // getTranslated(context, 'Downloading')!
            );
      } else {
        setSnackbar("Downloading"
            // getTranslated(context, 'Downloading')!
            );
        // final taskid = await FlutterDownloader.enqueue(
        //     url: url,
        //     savedDir: _filePath,
        //     headers: {"auth": "test_for_sql_encoding"},
        //     showNotification: true,
        //     openFileFromNotification: true);

        setState(() {
          // downloadlist[mid] = taskid.toString();
        });
      }
    }
  }

  Future<bool> Checkpermission() async {
    var status = await Permission.storage.status;

    if (status != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();

      if (statuses[Permission.storage] == PermissionStatus.granted) {
        FileDirectoryPrepare();
        return true;
      }
    } else {
      FileDirectoryPrepare();
      return true;
    }
    return false;
  }

  Future<Null> FileDirectoryPrepare() async {
    // _filePath = (await _findLocalPath()) +
    //     Platform.pathSeparator +
    //     'Download'; //"${StringsRes.mainappname}";

    if (Platform.isIOS) {
      Directory target = await getApplicationDocumentsDirectory();
      _filePath = target.path.toString();
    } else {
      Directory target = await getApplicationDocumentsDirectory();
      _filePath = target.path.toString();
    }
  }

  Widget attachItem(List<dynamic> attach, int index, ChatDataList message) {
    String? file = attach[index];
    String icon;
    if (type == "video")
      icon = "assets/images/video.png";
    else if (type == "document")
      icon = "assets/images/doc.png";
    else if (type == "spreadsheet")
      icon = "assets/images/sheet.png";
    else
      icon = "assets/images/zip.png";


    return file == null
        ? Container()
        : Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        Card(
          //margin: EdgeInsets.only(right: message.sender_id == myid ? 10 : 50, left: message.sender_id == myid ? 50 : 10, bottom: 10),
          elevation: 0.0,
          color: message.userType == "user"
              ? Colors.white.withOpacity(0.1)
              : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment:  message.userType == "user"
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: <Widget>[
                //_messages[index].issend ? Container() : Center(child: SizedBox(height:20,width: 20,child: new CircularProgressIndicator(backgroundColor: ColorsRes.secondgradientcolor,))),

                GestureDetector(
                  onTap: () {
                   // _requestDownload(attach[index].media, message.id);
                  },
                  child: Image.network(file,
                      width: 120,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/order_confirmed.png'))
                      /*: Image.asset(
                    icon,
                    width: 100,
                    height: 100,
                  ),*/
                ),
        ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(message.dateCreated!,
                style: const TextStyle(
                    color: Colors.black26,
                    fontSize: 9)),
          ),
        ),
      ],
    );
  }

/*  _imgFromGallery() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      if (mounted) setState(() {});
    } else {
      // User canceled the picker
    }
  }

  Future<void> sendMessage(String message) async {
    // SettingProvider settingsProvider =
    //     Provider.of<SettingProvider>(this.context, listen: false);

    setState(() {
      msgController.text = "";
    });
    var request = http.MultipartRequest("POST", Uri.parse(Apipath.sendMsgApi));
    // request.headers.addAll(headers);
    request.fields[USER_ID] = uid.toString();
    request.fields[TICKET_ID] = widget.id!;
    request.fields[USER_TYPE] = "vendor";
    request.fields[MESSAGE] = message;

    print(
        "this is request ========>>>  ${uid.toString()} ${widget.id} ${USER} ${message.toString()}");

    if (files != null) {
      for (int i = 0; i < files.length; i++) {
        var pic = await http.MultipartFile.fromPath(ATTACH, files[i].path);
        request.files.add(pic);
      }
    }

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    var getdata = json.decode(responseString);
    bool error = getdata["error"];
    String? msg = getdata['message'];
    var data = getdata["data"];
    if (!error) {
      insertItem(responseString);
    }
  }

  Future<void> getMsg() async {
    try {
      var data = {
        TICKET_ID: widget.id,
      };

      Response response = await post(Uri.parse(Apipath.getMsgApi), body: data)
          .timeout(Duration(seconds: 50));

      if (response.statusCode == 200) {
        var getdata = json.decode(response.body);

        bool error = getdata["error"];
        String? msg = getdata["message"];

        if (!error) {
          var data = getdata["data"];
          chatList =
              (data as List).map((data) => new Model.fromChat(data)).toList();
        } else {
          if (msg != "Ticket Message(s) does not exist") setSnackbar(msg!);
        }
        if (mounted) setState(() {});
      }
    } on TimeoutException catch (_) {
      setSnackbar("Something went wrong!");
    }
  }*/

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content:  Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black45),
      ),
      backgroundColor: Colors.white
    ));
  }

  msgRow() {
    return /*widget.status != "4"
        ?*/ Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              color: Colors.white,
              child: Column(

                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: imageList.map((e) => Padding(

                      padding: const EdgeInsets.only(left: 5),
                      child: Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),

                            child: Image.file(e,scale: 3,height: 100,width: 100,fit: BoxFit.fill,)),
                        Positioned(
                          right: 0,
                            top: -1,
                            child: InkWell(
                              onTap: (){
                                imageList.removeWhere((element) => e == element);
                                setState(() {

                                });
                              },
                                child: const Icon(Icons.close, size: 20,)))
                      ],),
                    )).toList()),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          //_imgFromGallery();
                          _getFromGallery();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: msgController,
                          maxLines: null,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          decoration: InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(
                                  color: Colors.black45),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {

                            sendMessage(msgController.text.trim());

                        },
                        backgroundColor: primaryColor,
                        elevation: 0,
                        child:isLoading ? const Center(child: CircularProgressIndicator(color: Colors.white,),) : const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }

  void getChatMessage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('userid');

    var headers = {
      'Cookie': 'ci_session=fb1e834ed7716c84e9817e5d5a9db04cde5fc664'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}Authentication/get_message'));
    request.fields.addAll({
      'user_id': uid ?? '',
      'ticket_id': widget.id ?? ''
    });

    print('__________${request.fields}_____________');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result =   await response.stream.bytesToString();
      print('___________${result}__________');
      var finalResult = GetChatMessage.fromJson(jsonDecode(result));
      setState(() {
        finalChatList = finalResult.data ?? [] ;
        finalChatList.reversed;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  void sendMessage(String trim) async{
    isLoading = true;
    setState(() {});


    var headers = {
      'Cookie': 'ci_session=a66a01d29b720c4b249aa1c631d2cb4db94b8ba1'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}Authentication/send_message'));
    request.fields.addAll({
      'user_type': 'user',
      'user_id': uid ?? '315',
      'ticket_id': widget.id ?? '5',
      'message': trim
    });

    if(imageList.isNotEmpty){
      imageList.forEach((element) async{
        request.files.add(
            await http.MultipartFile.fromPath('attachments[]', imageFile!.path));
      });
    }

   /* imageFile!=null ?
      request.files.add(
          await http.MultipartFile.fromPath('attachments[]', imageFile!.path)) : null;*/


    /*imageList.forEach((element) async{

    })*/

    request.headers.addAll(headers);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();


    msgController.clear();
    imageList.clear();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalresult = SendChatMessage.fromJson(jsonDecode(result));
      getChatMessage();
      isLoading = false;
      setState(() {
        isLoading = false;
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  ImagePicker _picker = ImagePicker();
File ? imageFile ;
List <File> imageList = [] ;
  _getFromGallery() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80, maxHeight: 480,maxWidth: 480);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print('${imageFile}gggggg');
        imageList.add(imageFile ?? File(''))  ;
      });
      //Navigator.pop(context);
    }
  }


}
