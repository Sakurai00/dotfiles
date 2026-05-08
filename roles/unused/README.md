# roles/unused

`roles/unused` は archive 用の置き場です。現在の `playbook.yml` からは参照されておらず、日常的な保守対象の role には含みません。

## 目的

- 過去に試した role や設定断片を履歴として残す
- 現役構成に組み込んでいないファイルを、削除ではなく archive として退避する
- 現役 role と archive の境界を、ディレクトリ構成から分かるようにする

## 運用方針

- 新しい role を追加するときは `roles/unused` ではなく、現役 role と同じ階層に作る
- archive を参照する必要がある場合でも、`playbook.yml` に直接組み込む前提では扱わない
- archive を現役化したくなったら、必要な形に整理したうえで通常の role として作り直す
