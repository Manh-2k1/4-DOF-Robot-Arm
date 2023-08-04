function varargout = QUIHOACHQUIDAO(varargin)
% QUIHOACHQUIDAO MATLAB code for QUIHOACHQUIDAO.fig
%      QUIHOACHQUIDAO, by itself, creates a new QUIHOACHQUIDAO or raises the existing
%      singleton*.
%
%      H = QUIHOACHQUIDAO returns the handle to a new QUIHOACHQUIDAO or the handle to
%      the existing singleton*.
%
%      QUIHOACHQUIDAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUIHOACHQUIDAO.M with the given input arguments.
%
%      QUIHOACHQUIDAO('Property','Value',...) creates a new QUIHOACHQUIDAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before QUIHOACHQUIDAO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to QUIHOACHQUIDAO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help QUIHOACHQUIDAO

% Last Modified by GUIDE v2.5 24-Jun-2022 23:33:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QUIHOACHQUIDAO_OpeningFcn, ...
                   'gui_OutputFcn',  @QUIHOACHQUIDAO_OutputFcn, ...
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


% --- Executes just before QUIHOACHQUIDAO is made visible.
function QUIHOACHQUIDAO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to QUIHOACHQUIDAO (see VARARGIN)

% Choose default command line output for QUIHOACHQUIDAO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes QUIHOACHQUIDAO wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%%
axes(handles.axes1);
load('solieuworkpaces_arm.mat');
grid on;

% --- Outputs from this function are returned to the command line.
function varargout = QUIHOACHQUIDAO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mode=2;
handles=guidata(hObject);
modelName='Assem1';
handles.modelName=modelName;
set_param('Assem1/mode','value',num2str(mode));
set_param(handles.modelName,'BlockReduction','off');
set_param(handles.modelName,'Stoptime','40');
set_param(handles.modelName,'SimulationMode','normal');
set_param(handles.modelName,'SimulationCommand','start');
load('quihoachquidao.mat');
axes(handles.axes1);
hold off;
grid on;
plot3(VITRI1(:,3),VITRI1(:,2),VITRI1(:,1),'<-b','MarkerSize',2);
hold on;
grid on;
axes(handles.axes2);
hold off;
grid on;
plot(Data.time(:,1),VITRI1(:,1),'<-r','MarkerSize',2);
hold on;
plot(Data.time(:,1),VITRI1(:,2),'<-b','MarkerSize',2);
hold on;
plot(Data.time(:,1),VITRI1(:,3),'<-k','MarkerSize',2);
hold on;
grid on;
legend('z','y','x');
axes(handles.axes3);
hold off;
plot(Data.time(:,1),VANTOC1(:,1),'<-r','MarkerSize',2);
hold on;
plot(Data.time(:,1),VANTOC1(:,2),'<-b','MarkerSize',2);
hold on;
plot(Data.time(:,1),VANTOC1(:,3),'<-k','MarkerSize',2);
hold on;
grid on;
legend('Vz','Vy','Vx');
axes(handles.axes4);
hold off;
grid on;
plot(Data.time(:,1),GIATOC1(:,1),'<-r','MarkerSize',2);
hold on;
plot(Data.time(:,1),GIATOC1(:,2),'<-b','MarkerSize',2);
hold on;
plot(Data.time(:,1),GIATOC1(:,3),'<-k','MarkerSize',2);
hold on;
grid on;
legend('ax','ay','az');
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mode=3;
handles=guidata(hObject);
modelName='Assem1';
handles.modelName=modelName;
set_param('Assem1/mode','value',num2str(mode));
set_param(handles.modelName,'BlockReduction','off');
set_param(handles.modelName,'Stoptime','40');
set_param(handles.modelName,'SimulationMode','normal');
set_param(handles.modelName,'SimulationCommand','start');
load('quihoachquidao.mat');
axes(handles.axes1);
hold off;
plot3(VITRI2(:,3),VITRI2(:,2),VITRI2(:,1),'<-b','MarkerSize',2);
hold on;
grid on;
axes(handles.axes2);
hold off;
grid on;
plot(Data.time(:,1),VITRI2(:,1),'<-r','MarkerSize',2);
hold on;
plot(Data.time(:,1),VITRI2(:,2),'<-b','MarkerSize',2);
hold on;
plot(Data.time(:,1),VITRI2(:,3),'<-k','MarkerSize',2);
hold on;
grid on;
legend('z','y','x');
axes(handles.axes3);
hold off;
plot(Data.time(:,1),VANTOC2(:,1),'<-r','MarkerSize',3);
hold on;
plot(Data.time(:,1),VANTOC2(:,2),'<-b','MarkerSize',3);
hold on;
plot(Data.time(:,1),VANTOC2(:,3),'<-k','MarkerSize',3);
hold on;
grid on;
legend('vz','vy','vy');
axes(handles.axes4);
hold off;
grid on;
plot(Data.time(:,1),GIATOC2(:,1),'<-r','MarkerSize',3);
hold on;
plot(Data.time(:,1),GIATOC2(:,2),'<-b','MarkerSize',3);
hold on;
plot(Data.time(:,1),GIATOC2(:,3),'<-k','MarkerSize',3);
hold on;
grid on;
legend('az','ay','ax');
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mode=1;
handles=guidata(hObject);
modelName='Assem1';
handles.modelName=modelName;
set_param('Assem1/mode','value',num2str(mode));
set_param(handles.modelName,'BlockReduction','off');
set_param(handles.modelName,'Stoptime','40');
set_param(handles.modelName,'SimulationMode','normal');
set_param(handles.modelName,'SimulationCommand','start');
load('quihoachquidao.mat');
axes(handles.axes1);
hold off;
plot3(VITRI(:,3),VITRI(:,2),VITRI(:,1),'<-b','MarkerSize',2);
hold on;
grid on;
axes(handles.axes2);
hold off;
grid on;
plot(Data.time(:,1),VITRI(:,1),'<-r','MarkerSize',2);
hold on;
plot(Data.time(:,1),VITRI(:,2),'<-b','MarkerSize',2);
hold on;
plot(Data.time(:,1),VITRI(:,3),'<-k','MarkerSize',2);
hold on;
grid on;
legend('z','y','x');
axes(handles.axes3);
hold off;
plot(Data.time(:,1),VANTOC(:,1),'<-r','MarkerSize',2);
hold on;
plot(Data.time(:,1),VANTOC(:,2),'<-b','MarkerSize',2);
hold on;
plot(Data.time(:,1),VANTOC(:,3),'<-k','MarkerSize',2);
hold on;
grid on;
legend('Vz','Vy','Vx');
axes(handles.axes4);
hold off;
grid on;
plot(Data.time(:,1),GIATOC(:,1),'<-r','MarkerSize',2);
hold on;
plot(Data.time(:,1),GIATOC(:,2),'<-b','MarkerSize',2);
hold on;
plot(Data.time(:,1),GIATOC(:,3),'<-k','MarkerSize',2);
hold on;
grid on;
legend('az','ay','ax');
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
chedo=2;
set_param('Assem1/Chedovanhanh','value',num2str(chedo));
run GUIDONGHOCVAQUIHOACHQUIDAO.m
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
