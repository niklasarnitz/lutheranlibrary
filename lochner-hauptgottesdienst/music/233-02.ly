\version "2.24.3"
% Scan 233, printed p. 208: Einleitung, Antwort der Gemeinde.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice = "choir" { \voiceOne f'2 g'2 a'1 f'2( g'2) a'1 g'1 \bar "|." }
      \new Voice { \voiceTwo c'2 c'2 c'1 d'2( e'2) f'1 e'1 }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t Und mit "dei :" nem \skip 1 "Gei :" "ste."
    }
    \new Staff <<
      \clef bass \key f \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne a2 g2 \once \override NoteColumn.force-hshift = #-0.6 f1 a2( c'2) c'1 c'1 }
      \new Voice { \voiceTwo f2 e2 \once \override NoteColumn.force-hshift = #0.6 f1 d2( c2) f1 c1 }
    >>
  >>

  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
