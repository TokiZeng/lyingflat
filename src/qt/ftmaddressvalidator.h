// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The FTM Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef FTM_QT_FTMADDRESSVALIDATOR_H
#define FTM_QT_FTMADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class FTMAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FTMAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** FTM address widget validator, checks for a valid ftm address.
 */
class FTMAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit FTMAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // FTM_QT_FTMADDRESSVALIDATOR_H
