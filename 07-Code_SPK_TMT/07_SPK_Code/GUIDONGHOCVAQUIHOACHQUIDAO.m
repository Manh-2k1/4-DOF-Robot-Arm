function varargout = GUIDONGHOCVAQUIHOACHQUIDAO(varargin)
% GUIDONGHOCVAQUIHOACHQUIDAO MATLAB code for GUIDONGHOCVAQUIHOACHQUIDAO.fig
%      GUIDONGHOCVAQUIHOACHQUIDAO, by itself, creates a new GUIDONGHOCVAQUIHOACHQUIDAO or raises the existing
%      singleton*.
%
%      H = GUIDONGHOCVAQUIHOACHQUIDAO returns the handle to a new GUIDONGHOCVAQUIHOACHQUIDAO or the handle to
%      the existing singleton*.
%
%      GUIDONGHOCVAQUIHOACHQUIDAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDONGHOCVAQUIHOACHQUIDAO.M with the given input arguments.
%
%      GUIDONGHOCVAQUIHOACHQUIDAO('Property','Value',...) creates a new GUIDONGHOCVAQUIHOACHQUIDAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIDONGHOCVAQUIHOACHQUIDAO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIDONGHOCVAQUIHOACHQUIDAO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIDONGHOCVAQUIHOACHQUIDAO

% Last Modified by GUIDE v2.5 23-May-2022 10:08:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIDONGHOCVAQUIHOACHQUIDAO_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIDONGHOCVAQUIHOACHQUIDAO_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUIDONGHOCVAQUIHOACHQUIDAO is made visible.
function GUIDONGHOCVAQUIHOACHQUIDAO_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
%% LAY GIA TRI BAN DAU
theta1=get(handles.slider1,'value'); 
set(handles.theta1,'string',num2str(theta1));

theta2=get(handles.slider2,'value'); 
set(handles.theta2,'string',num2str(theta2));

theta3=get(handles.slider3,'value'); 
set(handles.theta3,'string',num2str(theta3));

theta4=get(handles.slider4,'value'); 
set(handles.theta4,'string',num2str(theta4));
%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
%hien thi cac gia tri theta
%% TInh dong hoc nghich
phi=0;
set(handles.Px_inv,'string',num2str(Px));
set(handles.Py_inv,'string',num2str(Py));
set(handles.Pz_inv,'string',num2str(Pz));
set(handles.theta234,'string',num2str(phi));
theta=IK_4DOF(Px,Py,Pz,phi);
set(handles.theta1_inv,'string',num2str(theta(1)));
set(handles.theta2_inv,'string',num2str(theta(2)));
set(handles.theta3_inv,'string',num2str(theta(3)));
set(handles.theta4_inv,'string',num2str(theta(4)));
%% LIEN KET SIMULINK
set_param('Assem1/The1','value',num2str(theta1));
set_param('Assem1/The2','value',num2str(theta2));
set_param('Assem1/The3','value',num2str(theta3));
set_param('Assem1/The4','value',num2str(theta4));

function varargout = GUIDONGHOCVAQUIHOACHQUIDAO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function theta1_Callback(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta1 as text
%        str2double(get(hObject,'String')) returns contents of theta1 as a double
theta1_new=get(handles.theta1,'string');
theta1_new=str2num(theta1_new);
set(handles.slider1,'value',theta1_new); 
theta1=theta1_new;

theta2_new=get(handles.theta2,'string');
theta2_new=str2num(theta2_new);
set(handles.slider2,'value',theta2_new); 
theta2=theta2_new;

theta3_new=get(handles.theta3,'string');
theta3_new=str2num(theta3_new);
set(handles.slider3,'value',theta3_new); 
theta3=theta3_new;

theta4_new=get(handles.theta4,'string');
theta4_new=str2num(theta4_new);
set(handles.slider4,'value',theta4_new); 
theta4=theta4_new;


%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The1','value',num2str(theta1));
set_param('Assem1/The2','value',num2str(theta2));
set_param('Assem1/The3','value',num2str(theta3));
set_param('Assem1/The4','value',num2str(theta4));
% --- Executes during object creation, after setting all properties.
function theta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta2_Callback(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta2 as text
%        str2double(get(hObject,'String')) returns contents of theta2 as a double

theta1_new=get(handles.theta1,'string');
theta1_new=str2num(theta1_new);
set(handles.slider1,'value',theta1_new); 
theta1=theta1_new;

theta2_new=get(handles.theta2,'string');
theta2_new=str2num(theta2_new);
set(handles.slider2,'value',theta2_new); 
theta2=theta2_new;

theta3_new=get(handles.theta3,'string');
theta3_new=str2num(theta3_new);
set(handles.slider3,'value',theta3_new); 
theta3=theta3_new;

theta4_new=get(handles.theta4,'string');
theta4_new=str2num(theta4_new);
set(handles.slider4,'value',theta4_new); 
theta4=theta4_new;


%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The1','value',num2str(theta1));
set_param('Assem1/The2','value',num2str(theta2));
set_param('Assem1/The3','value',num2str(theta3));
set_param('Assem1/The4','value',num2str(theta4));

% --- Executes during object creation, after setting all properties.
function theta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta3_Callback(hObject, eventdata, handles)
% hObject    handle to theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta3 as text
%        str2double(get(hObject,'String')) returns contents of theta3 as a double
theta1_new=get(handles.theta1,'string');
theta1_new=str2num(theta1_new);
set(handles.slider1,'value',theta1_new); 
theta1=theta1_new;

theta2_new=get(handles.theta2,'string');
theta2_new=str2num(theta2_new);
set(handles.slider2,'value',theta2_new); 
theta2=theta2_new;

theta3_new=get(handles.theta3,'string');
theta3_new=str2num(theta3_new);
set(handles.slider3,'value',theta3_new); 
theta3=theta3_new;

theta4_new=get(handles.theta4,'string');
theta4_new=str2num(theta4_new);
set(handles.slider4,'value',theta4_new); 
theta4=theta4_new;


%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The1','value',num2str(theta1));
set_param('Assem1/The2','value',num2str(theta2));
set_param('Assem1/The3','value',num2str(theta3));
set_param('Assem1/The4','value',num2str(theta4));

% --- Executes during object creation, after setting all properties.
function theta3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta4_Callback(hObject, eventdata, handles)
% hObject    handle to theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta4 as text
%        str2double(get(hObject,'String')) returns contents of theta4 as a double
theta1_new=get(handles.theta1,'string');
theta1_new=str2num(theta1_new);
set(handles.slider1,'value',theta1_new); 
theta1=theta1_new;

theta2_new=get(handles.theta2,'string');
theta2_new=str2num(theta2_new);
set(handles.slider2,'value',theta2_new); 
theta2=theta2_new;

theta3_new=get(handles.theta3,'string');
theta3_new=str2num(theta3_new);
set(handles.slider3,'value',theta3_new); 
theta3=theta3_new;

theta4_new=get(handles.theta4,'string');
theta4_new=str2num(theta4_new);
set(handles.slider4,'value',theta4_new); 
theta4=theta4_new;

phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The1','value',num2str(theta1));
set_param('Assem1/The2','value',num2str(theta2));
set_param('Assem1/The3','value',num2str(theta3));
set_param('Assem1/The4','value',num2str(theta4));

% --- Executes during object creation, after setting all properties.
function theta4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

theta1=get(handles.slider1,'value'); 
set(handles.theta1,'string',num2str(theta1));

theta2=get(handles.slider2,'value'); 
set(handles.theta2,'string',num2str(theta2));

theta3=get(handles.slider3,'value'); 
set(handles.theta3,'string',num2str(theta3));

theta4=get(handles.slider4,'value'); 
set(handles.theta4,'string',num2str(theta4));
%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The1','value',num2str(theta1));
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
theta1=get(handles.slider1,'value'); 
set(handles.theta1,'string',num2str(theta1));

theta2=get(handles.slider2,'value'); 
set(handles.theta2,'string',num2str(theta2));

theta3=get(handles.slider3,'value'); 
set(handles.theta3,'string',num2str(theta3));

theta4=get(handles.slider4,'value'); 
set(handles.theta4,'string',num2str(theta4));
%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
Phi=theta2+theta3+theta4;
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The2','value',num2str(theta2));
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
theta1=get(handles.slider1,'value'); 
set(handles.theta1,'string',num2str(theta1));

theta2=get(handles.slider2,'value'); 
set(handles.theta2,'string',num2str(theta2));

theta3=get(handles.slider3,'value'); 
set(handles.theta3,'string',num2str(theta3));

theta4=get(handles.slider4,'value'); 
set(handles.theta4,'string',num2str(theta4));
%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The3','value',num2str(theta3));
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
theta1=get(handles.slider1,'value'); 
set(handles.theta1,'string',num2str(theta1));

theta2=get(handles.slider2,'value'); 
set(handles.theta2,'string',num2str(theta2));

theta3=get(handles.slider3,'value'); 
set(handles.theta3,'string',num2str(theta3));

theta4=get(handles.slider4,'value'); 
set(handles.theta4,'string',num2str(theta4));
%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
phi=theta2+theta3+theta4;
set(handles.theta234,'string',num2str(phi));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The4','value',num2str(theta4));
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
chedo=1;
set_param('Assem1/Chedovanhanh','value',num2str(chedo));
run QUIHOACHQUIDAO.m
% --- Executes on button press in START.
function START_Callback(hObject, eventdata, handles)
% hObject    handle to START (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles=guidata(hObject);
modelName='Assem1';
handles.modelName=modelName;
% 
% if modelIsLoaded(modelName)
%     load_system(modelName);
% end

set_param(handles.modelName,'BlockReduction','off');
set_param(handles.modelName,'Stoptime','inf');
set_param(handles.modelName,'SimulationMode','normal');
set_param(handles.modelName,'SimulationCommand','start');
set_param(handles.modelName, 'EnablePacing', 'on');
% set_param(handles.stop,'Disable','on');
% set_param(handles.start,'Enable','on');
   
%% Kiem tra load file
function modelLoaded = modelIsloaded(modelName)
try 
     modelLoaded=...
         ~isempty(find_system('Type','block_diagram','Name',modelName));
catch 
    modelLoaded=false;
end
function Px_inv_Callback(hObject, eventdata, handles)
% hObject    handle to Px_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Px_inv as text
%        str2double(get(hObject,'String')) returns contents of Px_inv as a double


% --- Executes during object creation, after setting all properties.
function Px_inv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Px_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Py_inv_Callback(hObject, eventdata, handles)
% hObject    handle to Py_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Py_inv as text
%        str2double(get(hObject,'String')) returns contents of Py_inv as a double


% --- Executes during object creation, after setting all properties.
function Py_inv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Py_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pz_inv_Callback(hObject, eventdata, handles)
% hObject    handle to Pz_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pz_inv as text
%        str2double(get(hObject,'String')) returns contents of Pz_inv as a double


% --- Executes during object creation, after setting all properties.
function Pz_inv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pz_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta234_Callback(hObject, eventdata, handles)
% hObject    handle to theta234 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta234 as text
%        str2double(get(hObject,'String')) returns contents of theta234 as a double


% --- Executes during object creation, after setting all properties.
function theta234_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta234 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta1_inv_Callback(hObject, eventdata, handles)
% hObject    handle to theta1_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta1_inv as text
%        str2double(get(hObject,'String')) returns contents of theta1_inv as a double

% --- Executes during object creation, after setting all properties.
function theta1_inv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta1_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function theta2_inv_Callback(hObject, eventdata, handles)
% hObject    handle to theta2_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta2_inv as text
%        str2double(get(hObject,'String')) returns contents of theta2_inv as a double


% --- Executes during object creation, after setting all properties.
function theta2_inv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta2_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function theta3_inv_Callback(hObject, eventdata, handles)
% hObject    handle to theta3_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta3_inv as text
%        str2double(get(hObject,'String')) returns contents of theta3_inv as a double


% --- Executes during object creation, after setting all properties.
function theta3_inv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta3_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta4_inv_Callback(hObject, eventdata, handles)
% hObject    handle to theta4_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta4_inv as text
%        str2double(get(hObject,'String')) returns contents of theta4_inv as a double


% --- Executes during object creation, after setting all properties.
function theta4_inv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta4_inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Px_Callback(hObject, eventdata, handles)
% hObject    handle to Px (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Px as text
%        str2double(get(hObject,'String')) returns contents of Px as a double


% --- Executes during object creation, after setting all properties.
function Px_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Px (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Py_Callback(hObject, eventdata, handles)
% hObject    handle to Py (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Py as text
%        str2double(get(hObject,'String')) returns contents of Py as a double


% --- Executes during object creation, after setting all properties.
function Py_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Py (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pz_Callback(hObject, eventdata, handles)
% hObject    handle to Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pz as text
%        str2double(get(hObject,'String')) returns contents of Pz as a double


% --- Executes during object creation, after setting all properties.
function Pz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in STOP.
function STOP_Callback(hObject, eventdata, handles)
% hObject    handle to STOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=guidata(hObject);
modelName='Assem1';
handles.modelName=modelName;
% 
% if modelIsLoaded(modelName)
%     load_system(modelName);
% end

set_param(handles.modelName,'BlockReduction','off');
set_param(handles.modelName,'Stoptime','10');
set_param(handles.modelName,'SimulationMode','normal');
set_param(handles.modelName,'SimulationCommand','stop');
set_param(handles.modelName, 'StartFcn', '');
% set_param(handles.stop,'Disable','on');
% set_param(handles.start,'Enable','on');


% --- Executes on button press in RESET.
function RESET_Callback(hObject, eventdata, handles)
% hObject    handle to RESET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theta1=0;
set(handles.slider1,'value',theta1); 
set(handles.theta1,'string',num2str(theta1));
theta2=0;
set(handles.slider2,'value',theta2); 
set(handles.theta2,'string',num2str(theta2));
theta3=0;
set(handles.slider3,'value',theta3); 
set(handles.theta3,'string',num2str(theta3));
theta4=0;
set(handles.slider4,'value',theta4); 
set(handles.theta4,'string',num2str(theta4));

%% TINH DONG HOC THUAN
P_EE=FK_4DOF(theta1,theta2,theta3,theta4);
Px=P_EE(1); Py=P_EE(2); Pz=P_EE(3);
% Hien thi cac gia tri Px_inv, Py_inv, Pz_inv vào các ô Text
set(handles.Px,'string',num2str(Px));
set(handles.Py,'string',num2str(Py));
set(handles.Pz,'string',num2str(Pz));
%hien thi cac gia tri theta
%% TInh dong hoc nghich
phi=0;
set(handles.Px_inv,'string',num2str(Px));
set(handles.Py_inv,'string',num2str(Py));
set(handles.Pz_inv,'string',num2str(Pz));
set(handles.theta234,'string',num2str(phi));
theta=IK_4DOF(Px,Py,Pz,phi);
set(handles.theta1_inv,'string',num2str(theta(1)));
set(handles.theta2_inv,'string',num2str(theta(2)));
set(handles.theta3_inv,'string',num2str(theta(3)));
set(handles.theta4_inv,'string',num2str(theta(4)));
%% LIEN KET VOI SIMULINK
set_param('Assem1/The1','value',num2str(theta(1)));
set_param('Assem1/The2','value',num2str(theta(2)));
set_param('Assem1/The3','value',num2str(theta(3)));
set_param('Assem1/The4','value',num2str(theta(4)));
% --- Executes on button press in SOLVE.
function SOLVE_Callback(hObject, eventdata, handles)
% hObject    handle to SOLVE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Px_new=get(handles.Px_inv,'String');
Px_new=str2num(Px_new);

Py_new=get(handles.Py_inv,'String');
Py_new=str2num(Py_new);

Pz_new=get(handles.Pz_inv,'String');
Pz_new=str2num(Pz_new);
theta234_new=get(handles.theta234,'String');
theta234_new=str2num(theta234_new);
%% tinh dong hoc nghich
the=IK_4DOF(Px_new,Py_new,Pz_new,theta234_new);
%nhap theta vao text
set(handles.theta1_inv,'string',num2str(the(1)));
set(handles.theta2_inv,'string',num2str(the(2)));
set(handles.theta3_inv,'string',num2str(the(3)));
set(handles.theta4_inv,'string',num2str(the(4)));

set_param('Assem1/The1','value',num2str(the(1)));
set_param('Assem1/The2','value',num2str(the(2)));
set_param('Assem1/The3','value',num2str(the(3)));
set_param('Assem1/The4','value',num2str(the(4)));
