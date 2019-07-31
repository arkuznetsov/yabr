Перем МенеджерОбработкиДанных; // ВнешняяОбработкаОбъект - обработка-менеджер, вызвавшая данный обработчик
Перем Идентификатор;           // Строка                 - идентификатор обработчика, заданный обработкой-менеджером
Перем ПараметрыОбработки;      // Структура              - параметры обработки
Перем Данные;                  // Произвольный           - произвольные данные для вывода в консоль
Перем ОбрабатыватьМассивПоэлементно;  // Булево          - Истина - входящий массив будет обработан поэлементно;
                                     //                    Ложь - входящий массив будет обработан как 1 значение.

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
	
	Возврат Ложь;
	
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
	                          "ОбрабатыватьМассивПоэлементно",
	                          "Булево",
	                          ,
	                          Истина,
	                          "Истина - входящий массив будет обработан поэлементно;
                              |Ложь - входящий массив будет обработан как 1 значение.");
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

// Функция - Возвращает значения параметров обработки данных
// 
// Возвращаемое значение:
//	Структура - параметры обработки данных
//
Функция ПараметрыОбработкиДанных() Экспорт
	
	Возврат ПараметрыОбработки;
	
КонецФункции // ПараметрыОбработкиДанных()

// Процедура - Устанавливает значения параметров обработки
//
// Параметры:
//	НовыеПараметры      - Структура     - значения параметров обработки
//
Процедура УстановитьПараметрыОбработкиДанных(Знач НовыеПараметры) Экспорт
	
	ПараметрыОбработки = НовыеПараметры;
	
	Если ПараметрыОбработки.Свойство("ОбрабатыватьМассивПоэлементно") Тогда
		ОбрабатыватьМассивПоэлементно = ПараметрыОбработки.ОбрабатыватьМассивПоэлементно;
	Иначе
		ОбрабатыватьМассивПоэлементно = Истина;
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

	Если ВРег(ИмяПараметра) = ВРег("ОбрабатыватьМассивПоэлементно") Тогда
		ОбрабатыватьМассивПоэлементно = Значение;
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
	
	Если ТипЗнч(Данные) = Тип("Массив")
	 ИЛИ ТипЗнч(Данные) = Тип("ФиксированныйМассив") Тогда
		Если ОбрабатыватьМассивПоэлементно Тогда
			Для Каждого ТекЭлемент Из Данные Цикл
				ВывестиДанные(ТекЭлемент);
			КонецЦикла;
		Иначе
			ВывестиДанные(Данные);
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры // ОбработатьДанные()

// Функция - возвращает текущие результаты обработки
//
// Возвращаемое значение:
//	Произвольный     - результаты обработки данных
//
Функция РезультатОбработки() Экспорт
	
	Возврат Неопределено;
	
КонецФункции // РезультатОбработки()

// Процедура - выполняет действия при окончании обработки данных
// и оповещает обработку-менеджер о завершении обработки данных
//
Процедура ЗавершениеОбработкиДанных() Экспорт
	
	ЗавершениеОбработкиДанныхВызовМенеджера();
	
КонецПроцедуры // ЗавершениеОбработкиДанных()

#КонецОбласти // ПрограммныйИнтерфейс

#Область ОбработкаДанных

// Процедура - выполняет вывод значения
//
//	Параметры:
//		Данные    - Произвольный     - данные для вывода
//
Процедура ВывестиДанные(Данные)
	
	ЗначениеДляВывода = "";
	
	Если ТипЗнч(Данные) = Тип("Массив")
	 ИЛИ ТипЗнч(Данные) = Тип("ФиксированныйМассив")
	 ИЛИ ТипЗнч(Данные) = Тип("Структура")
	 ИЛИ ТипЗнч(Данные) = Тип("ФиксированнаяСтруктура")
	 ИЛИ ТипЗнч(Данные) = Тип("Соответствие")
	 ИЛИ ТипЗнч(Данные) = Тип("ФиксированноеСоответствие") Тогда
	
		ЗначениеДляВывода = ПолучитьЗначениеJSON(Данные);
		
	ИначеЕсли ТипЗнч(Данные) = Тип("Строка") Тогда
		
		ЗначениеДляВывода = Данные;
		
	Иначе
		
		ЗначениеДляВывода = СокрЛП(Данные);
		
	КонецЕсли;
	
	СообщитьПользователю(ЗначениеДляВывода);
	
	ПродолжениеОбработкиДанныхВызовМенеджера(ЗначениеДляВывода);
	
КонецПроцедуры // ВывестиДанные()

// Функция - возвращает значение, преобразованное к строке в формате JSON
//
// Параметры:
//	Значение         - Произвольный            - произвольный тип, совместимый с форматом JSON
//
// Возвращаемое значение:
//	Строка           - преобразванное значение, строка в формате JSON
//
Функция ПолучитьЗначениеJSON(Знач Значение)
	
	Запись = Новый ЗаписьJSON();
	Запись.УстановитьСтроку(Новый ПараметрыЗаписиJSON(ПереносСтрокJSON.Unix, Символы.Таб));
	
	НастройкиСериализации = Новый НастройкиСериализацииJSON();
	НастройкиСериализации.ВариантЗаписиДаты      = ВариантЗаписиДатыJSON.УниверсальнаяДата;
	НастройкиСериализации.ФорматСериализацииДаты = ФорматДатыJSON.ISO;
	
	Попытка
		ЗаписатьJSON(Запись, Значение, НастройкиСериализации);
	Исключение
		ТекстОшибки = ПодробноеПредставлениеОшибки(ИнформацияОбОшибке());
		ВызватьИсключение ТекстОшибки;
	КонецПопытки;
	
	Возврат Запись.Закрыть();
	
КонецФункции // ПолучитьЗначениеJSON()

// Формирует и выводит сообщение, которое может быть связано с элементом 
// управления формы.
//
//  Параметры
//  ТекстСообщенияПользователю - Строка - текст сообщения.
//  КлючДанных                - Любая ссылка на объект информационной базы.
//                               Ссылка на объект информационной базы, к которому это сообщение относится,
//                               или ключ записи.
//  Поле                       - Строка - наименование реквизита формы
//  ПутьКДанным                - Строка - путь к данным (путь к реквизиту формы)
//
Процедура СообщитьПользователю(
		Знач ТекстСообщенияПользователю,
		Знач КлючДанных = Неопределено,
		Знач Поле = "",
		Знач ПутьКДанным = "")
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = ТекстСообщенияПользователю;
	Сообщение.Поле = Поле;
	
	Сообщение.КлючДанных = КлючДанных;
	
	Если НЕ ПустаяСтрока(ПутьКДанным) И КлючДанных = Неопределено Тогда
		Сообщение.ПутьКДанным = ПутьКДанным;
	КонецЕсли;
		
	Сообщение.Сообщить();
	
КонецПроцедуры // СообщитьПользователю()

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

#КонецОбласти // СлужебныеПроцедурыИФункции
