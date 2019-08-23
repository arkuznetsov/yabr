// ----------------------------------------------------------
// This Source Code Form is subject to the terms of the
// Mozilla Public License, v.2.0. If a copy of the MPL
// was not distributed with this file, You can obtain one
// at http://mozilla.org/MPL/2.0/.
// ----------------------------------------------------------
// Codebase: https://github.com/ArKuznetsov/yabr.1c/
// ----------------------------------------------------------

Перем МенеджерОбработкиДанных; // ВнешняяОбработкаОбъект - обработка-менеджер, вызвавшая данный обработчик
Перем Идентификатор;           // Строка                 - идентификатор обработчика, заданный обработкой-менеджером
Перем ПараметрыОбработки;      // Структура              - параметры обработки
Перем УровеньЭлементов;        // Число                  - номер уровня элементов в структуре данных,
                               //                          которые будут прочитаны и обработаны
Перем Данные;                  // Структура              - результаты чтения скобочного формата 1С
Перем НакопленныеДанные;	   // Массив(Структура)      - результаты обработки данных
Перем ПоследнийЭлемент;

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
	                          "УровеньЭлементов",
	                          "Число",
	                          ,
	                          3,
	                          "Номер уровня элементов в структуре данных, которые будут прочитаны и обработаны.");
	    
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
	
	Если ПараметрыОбработки.Свойство("УровеньЭлементов") Тогда
		УровеньЭлементов = ПараметрыОбработки.УровеньЭлементов;
	Иначе
		УровеньЭлементов = 3;
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

	Если ВРег(ИмяПараметра) = ВРег("УровеньЭлементов") Тогда
		УровеньЭлементов = Значение;
	КонецЕсли;
	
КонецПроцедуры // УстановитьПараметрОбработкиДанных()

// Процедура - устанавливает данные для обработки
//
// Параметры:
//	Данные      - Структура     - значения параметров обработки
//
Процедура УстановитьДанные(Знач ВходящиеДанные) Экспорт
	
	Данные = ВходящиеДанные;
	
КонецПроцедуры // УстановитьДанные()

// Процедура - выполняет обработку данных
//
Процедура ОбработатьДанные() Экспорт
	
	Если НЕ ДобавитьЗапись(Данные) Тогда
		Возврат;
	КонецЕсли;
	
	ПродолжениеОбработкиДанныхВызовМенеджера(НакопленныеДанные[НакопленныеДанные.ВГраница()]);
	
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

#Область ОбработкаДанных

// Процедура - проверяет, что элемент является записью ИБ файла настроек кластера
// и добавляет его в список информационных баз
//
// Параметры:
//	Элемент         - Структура       проверяемый элемент
//		*Родитель            - Структура                 - ссылка на элемент-родитель
//		*Уровень             - Число                     - уровень иерархии элемента
//		*Индекс              - Число                     - индекс элемента в массиве значений родителя
//		*НомераСтрок         - Соответсвие(Число)        - массив номеров строк из которых был прочитан элемент и его дочерние элементы
//		*НачСтрока           - Число                     - номер первой строки из которой был прочитан элемент и его дочерние элементы
//		*КонСтрока           - Число                     - номер последней строки из которой был прочитан элемент и его дочерние элементы
//		*Значения            - Массив(Структура)         - массив дочерних элементов
//
Функция ДобавитьЗапись(Элемент)
	
	Если НЕ (Элемент.Уровень = УровеньЭлементов ИЛИ Элемент.Уровень = УровеньЭлементов - 1) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Индекс0 = 3;
	Если Элемент.Уровень = УровеньЭлементов И Элемент.Индекс <= Индекс0 Тогда
		ПоследнийЭлемент = Элемент.Индекс;
		Возврат Ложь;
	КонецЕсли;
	
	Запись = Неопределено;
	
	Если Элемент.Уровень = УровеньЭлементов Тогда
		Контейнер = Элемент.Родитель.Значения;
		СдвигНач = 13;
		ИндексНач = Элемент.Индекс - СдвигНач;
		ПоследнийЭлемент = Элемент.Индекс;
	ИначеЕсли Элемент.Уровень = УровеньЭлементов - 1 И ПоследнийЭлемент > 0 Тогда
		Контейнер = Элемент.Значения;
		ИндексНач = ПоследнийЭлемент;
		ПоследнийЭлемент = 0;
	Иначе
		Возврат Ложь;
	КонецЕсли;
	
	СдвигНомерСтроки          = 2;
	СдвигКод                  = 3;
	СдвигКоличествоВызовов    = 4;
	СдвигВремяВключаяВызовы   = 5;
	СдвигВремя                = 6;
	СдвигПроцентВключаяВызовы = 7;
	СдвигПроцент              = 8;
	СдвигКлиент               = 9;
	СдвигСервер               = 10;
	СдвигВызовСервера         = 11;

	Запись = Новый Структура();
	Запись.Вставить("МодульИд"            , ОбработатьКавычкиВСтроке(Контейнер[ИндексНач].Значения[1]));
	Запись.Вставить("Модуль"              , ОбработатьКавычкиВСтроке(Контейнер[ИндексНач + 1]));
	Запись.Вставить("НомерСтроки"         , Число(Контейнер[ИндексНач + СдвигНомерСтроки]));
	Запись.Вставить("Код"                 , ОбработатьКавычкиВСтроке(Контейнер[ИндексНач + СдвигКод]));
	Запись.Вставить("КоличествоВызовов"   , Число(Контейнер[ИндексНач + СдвигКоличествоВызовов]));
	Запись.Вставить("ВремяВключаяВызовы"  , Число(Контейнер[ИндексНач + СдвигВремяВключаяВызовы]));
	Запись.Вставить("Время"               , Число(Контейнер[ИндексНач + СдвигВремя]));
	Запись.Вставить("ПроцентВключаяВызовы", Число(Контейнер[ИндексНач + СдвигПроцентВключаяВызовы]));
	Запись.Вставить("Процент"             , Число(Контейнер[ИндексНач + СдвигПроцент]));
	Запись.Вставить("Клиент"              , ?(Контейнер[ИндексНач + СдвигКлиент] = "1", Истина, Ложь));
	Запись.Вставить("Сервер"              , ?(Контейнер[ИндексНач + СдвигСервер] = "1", Истина, Ложь));
	Запись.Вставить("ВызовСервера"        , ?(Контейнер[ИндексНач + СдвигВызовСервера] = "1", Истина, Ложь));
	
	Если НЕ ТипЗнч(НакопленныеДанные) = Тип("Массив") Тогда
		НакопленныеДанные = Новый Массив();
	КонецЕсли;
	
	Если ТипЗнч(Запись) = Тип("Структура") Тогда
		НакопленныеДанные.Добавить(Запись);
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции // ДобавитьЗапись()

#КонецОбласти // ОбработкаДанных

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
	
	МенеджерОбработкиДанных.ПродолжениеОбработкиДанных(Элемент, Идентификатор);
	
КонецПроцедуры // ПродолжениеОбработкиДанныхВызовМенеджера()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанныхВызовМенеджера()
	
	Если МенеджерОбработкиДанных = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	МенеджерОбработкиДанных.ЗавершениеОбработкиДанных(Идентификатор);
	
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

// Функция - удаляет начальные, конечные и экранированные кавычки из строки
//
// Параметры:
//  ПарамСтрока	 - Строка - строка для обработки
// 
// Возвращаемое значение:
//   Строка - результирующая строка
//
Функция ОбработатьКавычкиВСтроке(Знач ПарамСтрока)
	
	ПарамСтрока = СтрЗаменить(ПарамСтрока, """""", """");
	
	Если Лев(ПарамСтрока, 1) = """" Тогда
		ПарамСтрока = Сред(ПарамСтрока, 2);
	КонецЕсли;
	
	Если Прав(ПарамСтрока, 1) = """" Тогда
		ПарамСтрока = Сред(ПарамСтрока, 1, СтрДлина(ПарамСтрока) - 1);
	КонецЕсли;
	
	Возврат СокрЛП(ПарамСтрока);
	
КонецФункции // ОбработатьКавычкиВСтроке()

// Функция - возвращает версию обработчика
// 
// Возвращаемое значение:
// 	Строка - версия обработчика
//
Функция Версия() Экспорт
	
	Возврат ЭтотОбъект.ПолучитьМакет("ВерсияОбработки").ПолучитьТекст();
	
КонецФункции // Версия()

#КонецОбласти // СлужебныеПроцедурыИФункции

ПоследнийЭлемент = 0;
