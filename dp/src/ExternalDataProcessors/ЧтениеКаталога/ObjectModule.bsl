//----------------------------------------------------------
//This Source Code Form is subject to the terms of the
//Mozilla Public License, v.2.0. If a copy of the MPL
//was not distributed with this file, You can obtain one
//at http://mozilla.org/MPL/2.0/.
//----------------------------------------------------------
//Codebase: https://github.com/ArKuznetsov/yabr.1c/
//----------------------------------------------------------

Перем МенеджерОбработкиДанных; // ВнешняяОбработкаОбъект - обработка-менеджер, вызвавшая данный обработчик
Перем Идентификатор;           // Строка                 - идентификатор обработчика, заданный обработкой-менеджером
Перем ПараметрыОбработки;      // Структура              - параметры обработки
Перем Путь;                    // Строка                 - путь к каталогу файлов для обработки
Перем МаскиФайлов;             // Строка                 - маски поиска файлов, разделенные ";"
Перем ИскатьВПодкаталогах;     // Булево                 - Истина - поиск будет также выполняться в подкаталогах 
Перем СортироватьПоИмени;      // Булево                 - Истина - найденные файлы будут отсортированы по имени
                               //                          отдельно для каждой указанной маски файлов
Перем НакопленныеДанные;	   // Массив(Структура)      - результаты обработки данных

#Область ПрограммныйИнтерфейс

// Функция - признак возможности обработки, принимать входящие данные
// 
// Возвращаемое значение:
//	Булево - Истина - обработка может принимать входящие данные для обработки;
//	         Ложь - обработка не принимает входящие данные;
//
Функция ПринимаетДанные() Экспорт
	
	Возврат Истина;
	
КонецФункции // ПринимаетДанные()

// Функция - признак возможности обработки, возвращать обработанные данные
// 
// Возвращаемое значение:
//	Булево - Истина - обработка может возвращать обработанные данные;
//	         Ложь - обработка не возвращает данные;
//
Функция ВозвращаетДанные() Экспорт
	
	Возврат Истина;
	
КонецФункции // ВозвращаетДанные()

// Функция - возвращает список параметров обработки
// 
// Возвращаемое значение:
//	Структура                                - структура входящих параметров обработки
//      *Тип                    - Строка         - тип параметра
//      *Обязательный           - Булево         - Истина - параметр обязателен
//      *ЗначениеПоУмолчанию    - Произвольный   - значение параметра по умолчанию
//      *Описание               - Строка         - описание параметра
//
Функция ОписаниеПараметров() Экспорт
	
	Параметры = Новый Структура();
	
	ДобавитьОписаниеПараметра(Параметры,
	                          "Путь",
	                          "Строка",
	                          Истина,
	                          "<каталог запуска обработки>",
	                          "Путь к каталогу для файлов для обработки.");
	ДобавитьОписаниеПараметра(Параметры,
	                          "МаскиФайлов",
	                          "Строка",
	                          ,
	                          "*.*",
	                          "Маски поиска файлов, разделенные "";"".");
	ДобавитьОписаниеПараметра(Параметры,
	                          "ИскатьВПодкаталогах",
	                          "Булево",
	                          ,
	                          Ложь,
	                          "Истина - поиск будет также выполняться в подкаталогах.");
	ДобавитьОписаниеПараметра(Параметры,
	                          "СортироватьПоИмени",
	                          "Булево",
	                          ,
	                          Истина,
	                          "Истина - найденные файлы будут отсортированы по имени
	                          |         отдельно для каждой указанной маски файлов.");
	    
	Возврат Параметры;
	
КонецФункции // ОписаниеПараметров()

// Функция - Возвращает обработку - менеджер
// 
// Возвращаемое значение:
//	ВнешняяОбработкаОбъект - обработка-менеджер
//
Функция МенеджерОбработкиДанных() Экспорт
	
	Возврат МенеджерОбработкиДанных;
	
КонецФункции // МенеджерОбработкиДанных()

// Процедура - Устанавливает обработку - менеджер
//
// Параметры:
//	НовыйМенеджерОбработкиДанных      - ВнешняяОбработкаОбъект - обработка-менеджер
//
Процедура УстановитьМенеджерОбработкиДанных(Знач НовыйМенеджерОбработкиДанных) Экспорт
	
	МенеджерОбработкиДанных = НовыйМенеджерОбработкиДанных;
	
КонецПроцедуры // УстановитьМенеджерОбработкиДанных()

// Функция - Возвращает идентификатор обработчика
// 
// Возвращаемое значение:
//	Строка - идентификатор обработчика
//
Функция Идентификатор() Экспорт
	
	Возврат Идентификатор;
	
КонецФункции // Идентификатор()

// Процедура - Устанавливает идентификатор обработчика
//
// Параметры:
//	НовыйИдентификатор      - Строка - новый идентификатор обработчика
//
Процедура УстановитьИдентификатор(Знач НовыйИдентификатор) Экспорт
	
	Идентификатор = НовыйИдентификатор;
	
КонецПроцедуры // УстановитьИдентификатор()

// Функция - Возвращает значения параметров обработки
// 
// Возвращаемое значение:
//	Структура - параметры обработки
//
Функция ПараметрыОбработкиДанных() Экспорт
	
	Возврат ПараметрыОбработки;
	
КонецФункции // ПараметрыОбработкиДанных()

// Процедура - Устанавливает значения параметров обработки данных
//
// Параметры:
//	НовыеПараметры      - Структура     - значения параметров обработки
//
Процедура УстановитьПараметрыОбработкиДанных(Знач НовыеПараметры) Экспорт
	
	ПараметрыОбработки = НовыеПараметры;
	
	Если ПараметрыОбработки.Свойство("Путь") Тогда
		Путь = ПараметрыОбработки.Путь;
	Иначе
		ВремФайл = Новый Файл(ЭтотОбъект.ИспользуемоеИмяФайла);
		Путь = ВремФайл.Путь;
	КонецЕсли;
	
	Если ПараметрыОбработки.Свойство("МаскиФайлов") Тогда
		МаскиФайлов = ПараметрыОбработки.МаскиФайлов;
	Иначе
		МаскиФайлов = "*.*";
	КонецЕсли;
	
	Если ПараметрыОбработки.Свойство("ИскатьВПодкаталогах") Тогда
		ИскатьВПодкаталогах = ПараметрыОбработки.ИскатьВПодкаталогах;
	Иначе
		ИскатьВПодкаталогах = Ложь;
	КонецЕсли;
	
	Если ПараметрыОбработки.Свойство("СортироватьПоИмени") Тогда
		СортироватьПоИмени = ПараметрыОбработки.СортироватьПоИмени;
	Иначе
		СортироватьПоИмени = Истина;
	КонецЕсли;
	
КонецПроцедуры // УстановитьПараметрыОбработкиДанных()

// Функция - Возвращает значение параметра обработки данных
// 
// Параметры:
//	ИмяПараметра      - Строка           - имя получаемого параметра
//
// Возвращаемое значение:
//	Произвольный      - значение параметра
//
Функция ПараметрОбработкиДанных(Знач ИмяПараметра) Экспорт
	
	Если НЕ ТипЗнч(ПараметрыОбработки) = Тип("Структура") Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Если НЕ ПараметрыОбработки.Свойство(ИмяПараметра) Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Возврат ПараметрыОбработки[ИмяПараметра];
	
КонецФункции // ПараметрОбработкиДанных()

// Процедура - Устанавливает значение параметра обработки
//
// Параметры:
//	ИмяПараметра      - Строка           - имя устанавливаемого параметра
//	Значение          - Произвольный     - новое значение параметра
//
Процедура УстановитьПараметрОбработкиДанных(Знач ИмяПараметра, Знач Значение) Экспорт
	
	Если НЕ ТипЗнч(ПараметрыОбработки) = Тип("Структура") Тогда
		ПараметрыОбработки = Новый Структура();
	КонецЕсли;
	
	ПараметрыОбработки.Вставить(ИмяПараметра, Значение);

	Если ВРег(ИмяПараметра) = ВРег("Путь") Тогда
		Путь = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("МаскиФайлов") Тогда
		МаскиФайлов = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("ИскатьВПодкаталогах") Тогда
		ИскатьВПодкаталогах = Значение;
	ИначеЕсли ВРег(ИмяПараметра) = ВРег("СортироватьПоИмени") Тогда
		СортироватьПоИмени = Значение;
	Иначе
		Возврат;
	КонецЕсли;
	
КонецПроцедуры // УстановитьПараметрОбработкиДанных()

// Процедура - устанавливает данные для обработки
//
// Параметры:
//	Данные      - Структура     - значения параметров обработки
//
Процедура УстановитьДанные(Знач ВходящиеДанные) Экспорт
	
	Путь = ВходящиеДанные;
	
КонецПроцедуры // УстановитьДанные()

// Процедура - выполняет обработку данных
//
Процедура ОбработатьДанные() Экспорт
	
	Если НЕ ТипЗнч(НакопленныеДанные) = Тип("Массив") Тогда
		НакопленныеДанные = Новый Массив();
	КонецЕсли;
	
	МассивМасок = СтрРазделить(МаскиФайлов, ";");
	
	Для Каждого ТекМаска Из МассивМасок Цикл
		МассивФайлов = НайтиФайлы(Путь, ТекМаска, ИскатьВПодкаталогах);
	
		СписокФайловПоМаске = Новый СписокЗначений();
		Для Каждого ТекФайл Из МассивФайлов Цикл
			СписокФайловПоМаске.Добавить(ТекФайл, ТекФайл.Имя);
		КонецЦикла;
		
		Если СортироватьПоИмени Тогда
			СписокФайловПоМаске.СортироватьПоПредставлению();
		КонецЕсли;
		
		Для Каждого ТекЭлемент Из СписокФайловПоМаске Цикл
			НакопленныеДанные.Добавить(ТекЭлемент.Значение.ПолноеИмя);
			ПродолжениеОбработкиДанныхВызовМенеджера(НакопленныеДанные[НакопленныеДанные.ВГраница()]);
		КонецЦикла;
			
	КонецЦикла;
	
КонецПроцедуры // ОбработатьДанные()

// Функция - возвращает текущие результаты обработки
//
// Возвращаемое значение:
//	Произвольный     - результаты обработки данных
//
Функция РезультатОбработки() Экспорт
	
	Возврат НакопленныеДанные;
	
КонецФункции // РезультатОбработки()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанных() Экспорт
	
	// Код при завершении обработки данных
	ЗавершениеОбработкиДанныхВызовМенеджера();
	
КонецПроцедуры // ЗавершениеОбработкиДанных()

#КонецОбласти // ПрограммныйИнтерфейс

#Область СлужебныеПроцедурыВызоваМенеджераОбработкиДанных

// Процедура - выполняет действия обработки элемента данных
// и оповещает обработку-менеджер о продолжении обработки элемента
//
//	Параметры:
//		Элемент    - Произвольный     - Элемент данных для продолжения обработки
//
Процедура ПродолжениеОбработкиДанныхВызовМенеджера(Элемент)
	
	Если МенеджерОбработкиДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	КодДляВыполнения = "Попытка
		               |	МенеджерОбработкиДанных.ПродолжениеОбработкиДанных(Элемент, Идентификатор);
	                   |Исключение
	                   |КонецПопытки";
	                   
	Выполнить(КодДляВыполнения);
	
КонецПроцедуры // ПродолжениеОбработкиДанныхВызовМенеджера()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанныхВызовМенеджера()
	
	Если МенеджерОбработкиДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	КодДляВыполнения = "Попытка
		               |	МенеджерОбработкиДанных.ЗавершениеОбработкиДанных(Идентификатор);
	                   |Исключение
	                   |КонецПопытки";
	                   
	Выполнить(КодДляВыполнения);
	
КонецПроцедуры // ЗавершениеОбработкиДанныхВызовМенеджера()

#КонецОбласти // СлужебныеПроцедурыВызоваМенеджераОбработкиДанных

#Область СлужебныеПроцедурыИФункции

// Функция - возвращает описание параметра обработки
// 
// Параметры:
//     ОписаниеПараметров     - Структура      - структура описаний параметров
//     Параметр               - Строка         - имя параметра
//     Тип                    - Строка         - список возможных типов параметра
//     Обязательный           - Булево         - Истина - параметр обязателен
//     ЗначениеПоУмолчанию    - Произвольный   - значение параметра по умолчанию
//     Описание               - Строка         - описание параметра
//
Процедура ДобавитьОписаниеПараметра(ОписаниеПараметров
	                              , Параметр
	                              , Тип
	                              , Обязательный = Ложь
	                              , ЗначениеПоУмолчанию = Неопределено
	                              , Описание = "")
	
	Если НЕ ТипЗнч(ОписаниеПараметров) = Тип("Структура") Тогда
		ОписаниеПараметров = Новый Структура();
	КонецЕсли;
	
	ОписаниеПараметра = Новый Структура();
	ОписаниеПараметра.Вставить("Тип"                , Тип);
	ОписаниеПараметра.Вставить("Обязательный"       , Обязательный);
	ОписаниеПараметра.Вставить("ЗначениеПоУмолчанию", ЗначениеПоУмолчанию);
	ОписаниеПараметра.Вставить("Описание"           , Описание);
	
	ОписаниеПараметров.Вставить(Параметр, ОписаниеПараметра);
	
КонецПроцедуры // ДобавитьОписаниеПараметра()

// Функция - возвращает версию обработчика
// 
// Возвращаемое значение:
// 	Строка - версия обработчика
//
Функция Версия() Экспорт
	
	//@skip-warning
	Возврат ЭтотОбъект.ПолучитьМакет("ВерсияОбработки").ПолучитьТекст();
	
КонецФункции // Версия()

#КонецОбласти // СлужебныеПроцедурыИФункции
